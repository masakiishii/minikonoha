Import("Deos.DScript");

assure reboot must work {
	System.p("sudo reboot -h now");
}

argue reboot must work {
	strategy argument by pre and post condition {
		assure web server must be alive before the fact {
			System.p("telnet @IP @PORT");
		}
		assure web server must be alive after the fact {
			System.p("telnet @IP @PORT");
		}
	}
}

System.p(@[reboot must work]);
