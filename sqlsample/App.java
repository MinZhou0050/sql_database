package sqlsample;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.GridBagLayout;
import java.awt.Dimension;
import javax.swing.*;

import java.awt.event.*;
import java.sql.ResultSet;


public class App extends JFrame {
	private JScrollPane scpDemo;

	public App() {
		setBounds(100, 100, 600, 450);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		Container c = getContentPane();
		c.setLayout(new GridLayout(2, 2, 10, 10));
	   
		JPanel jp1 = new JPanel(new GridLayout(6, 1, 10, 10));
		JPanel jp2 = new JPanel(new BorderLayout());
		JPanel jp3 = new JPanel(new GridLayout(1, 1, 10, 10));
		JPanel jp4 = new JPanel(new GridBagLayout());
		// jp4.setBackground(Color.cyan);


		jp1.setBorder(BorderFactory.createTitledBorder("Tables"));
		jp2.setBorder(BorderFactory.createTitledBorder("Input"));
		jp3.setBorder(BorderFactory.createTitledBorder("Result"));
		jp4.setBorder(BorderFactory.createTitledBorder("Submit"));

	   
		JButton btn1 = new JButton("db_book");
		btn1.setBackground(Color.lightGray);
		btn1.setForeground(Color.BLACK);
		jp1.add(btn1);

		JButton btn2 = new JButton("db_customer");
		btn2.setBackground(Color.lightGray);
		btn2.setForeground(Color.BLACK);
		jp1.add(btn2);
		
		JButton btn3 = new JButton("db_employee");
		btn3.setBackground(Color.lightGray);
		btn3.setForeground(Color.BLACK);
		jp1.add(btn3);
		
		JButton btn4 = new JButton("db_order");
		btn4.setBackground(Color.lightGray);
		btn4.setForeground(Color.BLACK);
		jp1.add(btn4);
		
		JButton btn5 = new JButton("db_orderdetail");
		btn5.setBackground(Color.lightGray);
		btn5.setForeground(Color.BLACK);
		jp1.add(btn5);
		
		JButton btn6 = new JButton("db_shipper");
		btn6.setBackground(Color.lightGray);
		btn6.setForeground(Color.BLACK);
		jp1.add(btn6);

		JButton btn9 = new JButton("db_subject");
		btn9.setBackground(Color.lightGray);
		btn9.setForeground(Color.BLACK);
		jp1.add(btn9);

		JButton btn10 = new JButton("db_supplier");
		btn10.setBackground(Color.lightGray);
		btn10.setForeground(Color.BLACK);
		jp1.add(btn10);

		/**
		JButton btn11 = new JButton("Add New");
		btn11.setBackground(Color.lightGray);
		btn11.setForeground(Color.BLACK);
		jp1.add(btn11);
		*/

		JTextArea input_Text = new JTextArea();
		jp2.add(input_Text, BorderLayout.CENTER);
		/**
		Object[][] columnNames = {
								{"ID",
								"Name"}
								};
							
		Object[][] data = {
			{"1", "Marcury"
			},
			{"2", "Doe"
			},
			{"3", "Black"
			},
			{"4", "White"
			},
			{"5", "Brown"
			}
		};
		*/
		
		this.scpDemo = new JScrollPane();
		
		btn1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
				String sql = "select * from db_book";
				getSQLRS(sql);
			}
		});

		btn2.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
				String sql = "select * from db_customer";
				getSQLRS(sql);
			}
		});

		btn3.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
				String sql = "select * from db_employee";
				getSQLRS(sql);
			}
		});	

		btn4.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
				String sql = "select * from db_order";
				getSQLRS(sql);
			}
		});	

		btn5.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
				String sql = "select * from db_order_detail";
				getSQLRS(sql);
			}
		});	

		btn6.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
				String sql = "select * from db_shipper";
				getSQLRS(sql);
			}
		});	

		btn9.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
				String sql = "select * from db_subject";
				getSQLRS(sql);
			}
		});	

		btn10.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
				String sql = "select * from db_supplier";
				getSQLRS(sql);
			}
		});	

		JButton btn7 =  new JButton("Submit");
		btn7.setPreferredSize(new Dimension(100, 40));
		btn7.setBackground(Color.lightGray);
		btn7.setForeground(Color.BLACK);
		jp4.add(btn7);

		btn7.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
				String sql = input_Text.getText();
				getSQLRS(sql);
			}
		});	

		JButton btn8 =  new JButton("Clearn");
		btn8.setPreferredSize(new Dimension(100, 40));
		btn8.setBackground(Color.lightGray);
		btn8.setForeground(Color.BLACK);
		jp4.add(btn8);

		btn8.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if(input_Text != null){
					input_Text.setText(null);	
				}
            }
        });
		
		
		jp3.add(scpDemo);

		c.add(jp1);
		c.add(jp2);
		c.add(jp3);
		c.add(jp4);

		setVisible(true);
		
	}

	public static void main(String[] args) {
		new App();
	}

	public void getSQLRS(String sql) {
		try {
			
			ResultSet rs = (ResultSet) exec.main(sql);	
			int count = 0;
			
			while(rs.next()){
				count++;
			}
			
			java.sql.ResultSetMetaData rsmd = rs.getMetaData();
			int columnCount = rsmd.getColumnCount(); //列数
			// System.out.println(columnCount);
			// String columnName;
			String[] columnNames = new String[columnCount];
			for(int i=1;i<=columnCount;i++){
				columnNames[i-1] = rsmd.getColumnName(i); //第一列列名
			}
			// System.out.println(columnNames);

			// String[] columnNames = {"BookID","Title","UnitPrice","Author","Quantity","SupplierID","SubjectID"};
			
			// Object[][] data = new Object[count][7];
			Object[][] data = new Object[count][columnCount];

			ResultSet rs0 = (ResultSet) exec.main(sql);

			count = 0;
			while(rs0.next()){
				for(int i=0;i<columnCount;i++){
					data[count][i] = rs0.getString(columnNames[i]);
				}
				count++;
			}
			
			JTable output_Text = new JTable(data,columnNames);	
			this.scpDemo.getViewport().add(output_Text);
			
		} catch (Exception ex) {
			System.out.println("Unkown Error:" + ex.getMessage());
		}
	}
}







    /** 
    public static void main(String[] args) throws Exception {
        JFrame frame = new JFrame("Chat Frame");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 400);

        // Creating the MenuBar and adding components
        JMenuBar mb = new JMenuBar();
        JMenu m1 = new JMenu("FILE");
        JMenu m2 = new JMenu("Help");
        mb.add(m1);
        mb.add(m2);
        JMenuItem m11 = new JMenuItem("Open");
        JMenuItem m22 = new JMenuItem("Save as");
        m1.add(m11);
        m1.add(m22);

        // Text Area at the Center
        JTextArea ta = new JTextArea();

        // Creating the panel at bottom and adding components
        JPanel panel = new JPanel(); // the panel is not visible in output
        JLabel label = new JLabel("Enter Text");
        JTextField tf = new JTextField(10);
        JButton send = new JButton("Send");
        JButton reset = new JButton("Reset");

        // Handling Button Click Event
        send.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                ta.setText(tf.getText());
            }
        });
        panel.add(label); // Components Added using Flow Layout
        panel.add(tf);
        panel.add(send);
        panel.add(reset);

        //Adding Components to the frame.
        frame.getContentPane().add(BorderLayout.SOUTH, panel);
        frame.getContentPane().add(BorderLayout.NORTH, mb);
        frame.getContentPane().add(BorderLayout.CENTER, ta);
        frame.setVisible(true);
    }
    */


