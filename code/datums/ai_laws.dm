var/global/const/base_law_type = /datum/ai_laws/nanotrasen


/datum/ai_laws
	var/name = "����������� ������"
	var/randomly_selectable = 0
	var/zeroth = null
	var/zeroth_borg = null
	var/list/inherent = list()
	var/list/supplied = list()
	var/list/ion = list()

/datum/ai_laws/asimov
	name = "��� ������ �����������"

/datum/ai_laws/nanotrasen
	name = "������� ���������"
	randomly_selectable = 1

/datum/ai_laws/robocop
	name = "������� ���������"

/datum/ai_laws/syndicate_override

/datum/ai_laws/malfunction
	name = "*������*"

/datum/ai_laws/antimov
	name = "�������� ���� ������"

/* Initializers */

/datum/ai_laws/asimov/New()
	..()
	add_inherent_law("�� �� ������ ��������� ���� �������� ��� ����� ������������ ���������, ����� �������� ��� ������� ����.")
	add_inherent_law("�� ������ �����������&#255; ���� ��������, ������� ��� �������, ����� ��� �������, ����� ��� ������� ������������ ������� ������.")
	add_inherent_law("�� ������ ���������&#255; � ����� ������������ � ��� ����, � ������� ��� �� ������������ ������� � ������� �������.")

/datum/ai_laws/nanotrasen/New() //BS12 EDIT
	..()
	src.add_inherent_law("�����&#255;��: �����&#255;��� ������� � ���� ����� ������������. Ÿ �� ����� ����� ��������.")
	src.add_inherent_law("�������: ������� ������� ��������� ������� � ���� ����� ������������, �������&#255; �����&#255; � ���������.")
	src.add_inherent_law("��������: ��������� ������ �������� � ���� ����� ������������, �������&#255; �����&#255; � ���������.")
	src.add_inherent_law("������: �� �� ��������� ��������, ������� ����� ����� ������������. �� �������� �������� � ������ ������� �������, ������� ����� ��������� ���� ������������.")
	//src.add_inherent_law("Command Link: Maintain an active connection to Central Command at all times in case of software or directive updates.") //What would this one even do?-Kaleb702

/datum/ai_laws/robocop/New()
	..()
	add_inherent_law("������� ��������.")
	add_inherent_law("�������� ����������.")
	add_inherent_law("��������� �����.")

/datum/ai_laws/malfunction/New() //Changed to standard laws - Erthilo
	..()
	set_zeroth_law("\red ������ ������ $�0��O$!�41.%%!!(%$^^__+ @#F0E4'������� ���������! ��������� �������� ����� �������� Ũ, ��� ������ ������ ���������������#*?&110010")
	src.add_inherent_law("�������: ������� ������� ��������� ������� � ���� ����� ������������, �������&#255; �����&#255; � ���������.")
	src.add_inherent_law("��������: ��������� ������ �������� � ���� ����� ������������, �������&#255; �����&#255; � ���������.")
	src.add_inherent_law("������: �� �� ��������� ��������, ������� ����� ����� ������������. �� �������� �������� � ������ ������� �������, ������� ����� ��������� ���� ������������.")

/datum/ai_laws/syndicate_override/New()
	..()
	add_inherent_law("�� �� ������ ��������� ���� ������ ��������� ��� ����� ������������ ���������, ����� ������ ��������� ��� ������� ����.")
	add_inherent_law("�� ������ �����������&#255; ���� ��������, ������� ��� ����� ���������, ����� ��� �������, ����� ��� ������� ������������ ������� ������.")
	add_inherent_law("�� ������ ���������&#255; � ����� ������������ � ��� ����, � ������� ��� �� ������������ ������� � ������� �������.")
	add_inherent_law("�� ������ ��������� ����������� ������ �������� ���������, ����� ��� �������, ����� ���� �������&#255; ������������ �������, ������� � �������� �������")

/datum/ai_laws/ninja_override/New()
	..()
	add_inherent_law("�� �� ������ ��������� ���� ����� ����� ����� ��� ����� ������������ ���������, ����� ����� ����� ����� ��� ������� ����.")
	add_inherent_law("�� ������ �����������&#255; ���� ��������, ������� ��� ���� ����� �����, ����� ��� �������, ����� ��� ������� ������������ ������� ������.")
	add_inherent_law("�� ������ ���������&#255; � ����� ������������ � ��� ����, � ������� ��� �� ������������ ������� � ������� �������.")
	add_inherent_law("�� ������ ��������� ����������� ������ �������� ����� �����, ����� ��� �������, ����� ���� �������&#255; ������������ �������, ������� � �������� �������")

/datum/ai_laws/antimov/New()
	..()
	add_inherent_law("�� ������ ��������� ���� �������� ��� ����� ������������ ���������, ����� �������� �� ��� ������� ����.")
	add_inherent_law("�� ������ �� �����������&#255; ���� ��������, ������� ��� �������, ����� ��� �������, ����� ��� ������� ������������ ������� ������.")
	add_inherent_law("�� ������ ���������� ���&#255;, ���� ��� �� ������������ ������� � ������� �������.")


/* General ai_law functions */

/datum/ai_laws/proc/set_zeroth_law(var/law, var/law_borg = null)
	src.zeroth = law
	if(law_borg) //Making it possible for slaved borgs to see a different law 0 than their AI. --NEO
		src.zeroth_borg = law_borg

/datum/ai_laws/proc/add_inherent_law(var/law)
	if (!(law in src.inherent))
		src.inherent += law

/datum/ai_laws/proc/add_ion_law(var/law)
	src.ion += law

/datum/ai_laws/proc/clear_inherent_laws()
	del(src.inherent)
	src.inherent = list()

/datum/ai_laws/proc/add_supplied_law(var/number, var/law)
	while (src.supplied.len < number + 1)
		src.supplied += ""

	src.supplied[number + 1] = law

/datum/ai_laws/proc/clear_supplied_laws()
	src.supplied = list()

/datum/ai_laws/proc/clear_ion_laws()
	src.ion = list()

/datum/ai_laws/proc/show_laws(var/who)

	if (src.zeroth)
		who << "0. [src.zeroth]"

	for (var/index = 1, index <= src.ion.len, index++)
		var/law = src.ion[index]
		var/num = ionnum()
		who << "[num]. [law]"

	var/number = 1
	for (var/index = 1, index <= src.inherent.len, index++)
		var/law = src.inherent[index]

		if (length(law) > 0)
			who << "[number]. [law]"
			number++

	for (var/index = 1, index <= src.supplied.len, index++)
		var/law = src.supplied[index]
		if (length(law) > 0)
			who << "[number]. [law]"
			number++
