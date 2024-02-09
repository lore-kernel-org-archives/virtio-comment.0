Return-Path: <virtio-comment-return-9100-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C125C4828F
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Feb 2024 22:57:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A84342CAFC
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Feb 2024 22:57:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8D397986B77
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Feb 2024 22:57:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 76A65986B65; Fri,  9 Feb 2024 22:57:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8A5239869DF
	for <virtio-comment@lists.oasis-open.org>; Fri,  9 Feb 2024 22:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707519418; x=1708124218;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c1C5Og8TkkgCR3YMWMXS/+Et5CUTm8qQOWsUM3K5Yvg=;
        b=t8uuc0Z5HniI5fVdlPLfpZoKUGYlh6N5T2JVhzEDUGX7D4admvKJ4zjLFkOGiOH6HB
         MhacHQcg6tbSSdE1O2XvTEo3DWUXWoqjropEy5yOQ/oeR1/qsWBV7vCCgotEWrxgeqFB
         U5LT0uB/Y+4eLfbX09ZmOYo/4kh05aNdH5BgTlSr6SJxch0jY8r8xJoQNF85X9cGXI6w
         SFwXz/HcXWkNCDm6x0ZPth0H3NVpxvnN+yORCijbGE97FJQELcxStOXsAFY5J0JFghBg
         bETr26uXgUN7rnPujQMMBe3Km2WJbwj3attMtX+oedRZSGQa+wPBjP32LpFrqE4AdY5B
         a0JQ==
X-Gm-Message-State: AOJu0YzUgRQWeOtVrFdTDTxaghz8DqRJV7CHs76Axzg54gBbGaN9TuGa
	P7Ip8xs9uI3H2X0pP8wKLiuggeiklm35UwjK55/4v5tfQUg9ArA5Gok9Eg//LZmrNHjoGJrFq7Z
	/wSrqifV0oxJhagvceAxjvnNj0hqjzdTFXC4DnAye9wKXBaC7FvqFcbH7W+E=
X-Google-Smtp-Source: AGHT+IGmsqGHmRrpRqHwdjMCDnvVbukUKsaEzRfuYwa/eSpT6f/geVsRy0nEiWp+jPlJR+FKM5EwgkBZJKxWRANYd3U=
X-Received: by 2002:a25:8405:0:b0:dc2:5041:ce18 with SMTP id
 u5-20020a258405000000b00dc25041ce18mr605610ybk.23.1707519397626; Fri, 09 Feb
 2024 14:56:37 -0800 (PST)
MIME-Version: 1.0
From: Scott McGrath <scott.mcgrath@oasis-open.org>
Date: Fri, 9 Feb 2024 17:56:27 -0500
Message-ID: <CAD2Xst--RVrpuR1F_zgMzFMyjYYnfhBabzYiiLd2aqrS-SKYnQ@mail.gmail.com>
To: obix-comment@lists.oasis-open.org, ocpp-comment@lists.oasis-open.org, 
	odata-comment@lists.oasis-open.org, odf-adoption-comment@lists.oasis-open.org, 
	office-comment@lists.oasis-open.org, ohdf-comment@lists.oasis-open.org, 
	oic-comment@lists.oasis-open.org, openc2-comment@lists.oasis-open.org, 
	openeox-comment@lists.oasis-open.org, orms-comment@lists.oasis-open.org, 
	oslc-automation-comment@lists.oasis-open.org, 
	oslc-ccm-comment@lists.oasis-open.org, oslc-core-comment@lists.oasis-open.org, 
	oslc-domains-comment@lists.oasis-open.org, 
	oslc-promcode-comment@lists.oasis-open.org, 
	pbd-se-comment@lists.oasis-open.org, pkcs11-comment@lists.oasis-open.org, 
	pki-comment@lists.oasis-open.org, pki-tc-comment@lists.oasis-open.org, 
	plcs-comment@lists.oasis-open.org, pmrm-comment@lists.oasis-open.org, 
	pps-comment@lists.oasis-open.org, provision-comment@lists.oasis-open.org, 
	quomos-comment@lists.oasis-open.org, regrep-comment@lists.oasis-open.org, 
	relax-ng-comment@lists.oasis-open.org, 
	remote-control-comment@lists.oasis-open.org, 
	rights-comment@lists.oasis-open.org, s-ramp-comment@lists.oasis-open.org, 
	saf-comment@lists.oasis-open.org, sam-comment@lists.oasis-open.org, 
	sarif-comment@lists.oasis-open.org, sca-assembly-comment@lists.oasis-open.org, 
	sca-bindings-comment@lists.oasis-open.org, 
	sca-bpel-comment@lists.oasis-open.org, sca-c-cpp-comment@lists.oasis-open.org, 
	sca-j-comment@lists.oasis-open.org, sca-policy-comment@lists.oasis-open.org, 
	sdd-comment@lists.oasis-open.org, sdo-comment@lists.oasis-open.org, 
	search-ws-comment@lists.oasis-open.org, 
	security-services-comment@lists.oasis-open.org, 
	semantic-ex-comment@lists.oasis-open.org, set-comment@lists.oasis-open.org, 
	shoes-markup-comment@lists.oasis-open.org, 
	soa-blueprints-comment@lists.oasis-open.org, 
	soa-eerp-comment@lists.oasis-open.org, soa-rm-comment@lists.oasis-open.org, 
	soa-tel-comment@lists.oasis-open.org, tab-comment@lists.oasis-open.org, 
	tac-comment@lists.oasis-open.org, tag-comment@lists.oasis-open.org, 
	tamie-comment@lists.oasis-open.org, tax-comment@lists.oasis-open.org, 
	tgf-comment@lists.oasis-open.org, tm-pubsubj-comment@lists.oasis-open.org, 
	topicmaps-comment@lists.oasis-open.org, tosca-comment@lists.oasis-open.org, 
	trans-ws-comment@lists.oasis-open.org, trust-el-comment@lists.oasis-open.org, 
	ubl-comment@lists.oasis-open.org, uddi-comment@lists.oasis-open.org, 
	uddi-spec-comment@lists.oasis-open.org, uima-comment@lists.oasis-open.org, 
	uiml-comment@lists.oasis-open.org, unitsml-comment@lists.oasis-open.org, 
	uoml-comment@lists.oasis-open.org, uoml-x-comment@lists.oasis-open.org, 
	vel-comment@lists.oasis-open.org, virtio-comment@lists.oasis-open.org, 
	vsmi-comment@lists.oasis-open.org, was-comment@lists.oasis-open.org, 
	wemi-comment@lists.oasis-open.org, ws-brsp-comment@lists.oasis-open.org, 
	ws-caf-comment@lists.oasis-open.org, ws-calendar-comment@lists.oasis-open.org, 
	ws-dd-comment@lists.oasis-open.org, ws-rx-comment@lists.oasis-open.org, 
	ws-sx-comment@lists.oasis-open.org, ws-tx-comment@lists.oasis-open.org, 
	wsbpel-comment@lists.oasis-open.org, wsdm-comment@lists.oasis-open.org, 
	wsfed-comment@lists.oasis-open.org, wsia-comment@lists.oasis-open.org, 
	wsn-comment@lists.oasis-open.org, wsqm-comment@lists.oasis-open.org, 
	wsrf-comment@lists.oasis-open.org, wsrm-comment@lists.oasis-open.org, 
	wsrp-comment@lists.oasis-open.org, wss-comment@lists.oasis-open.org, 
	wss-m-comment@lists.oasis-open.org, xacml-comment@lists.oasis-open.org, 
	xcbf-comment@lists.oasis-open.org, xdi-comment@lists.oasis-open.org, 
	xliff-comment@lists.oasis-open.org, xliff-omos-comment@lists.oasis-open.org, 
	xmile-comment@lists.oasis-open.org, xmlconf-comment@lists.oasis-open.org, 
	xmlvoc-comment@lists.oasis-open.org, xri-comment@lists.oasis-open.org, 
	xslt-conformance-comment@lists.oasis-open.org, 
	xspa-comment@lists.oasis-open.org
Content-Type: multipart/alternative; boundary="00000000000024a22a0610fad79e"
Subject: [virtio-comment] Migration schedule update for this mail list

--00000000000024a22a0610fad79e
Content-Type: text/plain; charset="UTF-8"

I am very pleased to announce a new List Mail system will be implemented
for this list shortly.

The legacy list engine in use since 2003 will go offline for migration
20-24 February.  You are receiving this message because you are a
subscriber to the list receiving this message.

This transition will provide significant improvements and will change how
you interact with your mail lists.  See below for more information about
the changes, the transition schedule and what you can do to help.

Changes to Expect

The new platform is built in a modern web environment and mail delivery
mechanism. with a number of new features to improve both your platform user
experience and ability to engage with the OASIS community.  Key features
include:


   -

   Mail systems that you can depend on!  The new tools support and comply
   with major deliverability and anti-spoofing standards.  This will eliminate
   many of the sending and deliverability issues your group may be experiencing



   -

   Modern web interface and design for your committee internal work and
   public presentation of your work



   -

   If you are on this public list in addition to Technical Committees, Open
   Projects, and other community engagement mail lists you can manage this
   experience in one cohesive package



   -

   All resources created in the legacy email system will be migrated and
   available cohesively with your new work in the new platform.  All URL links
   for assets in the old platform will redirect to the new location



   -

   After the migration you will be directed where to send future messages
   for this list and where to find the archives.  You should update your
   bookmark and email contact list accordingly



   -

   After the migration you will be required to create or login to an
   existing OASIS public community or member account to manage your
   subscriptions.  Legacy-style subscribe and unsubscribe email messages to
   the server will not be respected.



The Transition Schedule

This mail list will be offline 20-24 February. During the downtime you will
not receive email messages sent to this list or have access to the
archive.  Senders will receive a reply pointing them to current migration
status information and where to find the new resources.


What You Should Do Now

If you no longer wish to subscribe to this list, send a message to
[listname]-unsubscribe@lists.oasis-open.org

Otherwise, watch for further messages in the coming days to include the new
list mailing address and archive location.

Feel free to contact me with any questions, and thanks for your patience
with the inevitable short-term inconvenience implementing these
improvements will bring.


-- 
Scott McGrath

Chief Operating Officer

OASIS Open


+1 781-929-7308 Mobile
scott.mcgrath@oasis-open.org
www.oasis-open.org

--00000000000024a22a0610fad79e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-cd17843b-7fff-0109-34=
2d-587a2dfea827"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">I am very pleased to announce a new List Mail system will be im=
plemented for this list shortly.=C2=A0</span></p><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-weight:700;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline">The legac=
y list engine in use since 2003 will go offline for migration 20-24 Februar=
y.</span><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:r=
gb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;vertical-align:baseli=
ne">=C2=A0 You are receiving this message because you are a subscriber to t=
he list receiving this message.</span></p><br><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-al=
ternates:normal;vertical-align:baseline">This transition will provide signi=
ficant improvements and will change how you interact with your mail lists.=
=C2=A0 See below for more information about the changes, the transition sch=
edule and what you can do to help.</span></p><br><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-weight:700;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline">Changes to Expe=
ct</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">The new platform is built in a modern web environment and mail =
delivery mechanism. with a number of new features to improve both your plat=
form user experience and ability to engage with the OASIS community.=C2=A0 =
Key features include:</span></p><br><ul style=3D"margin-top:0px;margin-bott=
om:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline">Mail systems that you can depend on!=C2=A0 The new too=
ls support and comply with major deliverability and anti-spoofing standards=
.=C2=A0 This will eliminate many of the sending and deliverability issues y=
our group may be experiencing</span></p></li></ul><br><ul style=3D"margin-t=
op:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">Modern web interface and design f=
or your committee internal work and public presentation of your work</span>=
</p></li></ul><br><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">If you are on this public list in addition to Technical Committees, Open=
 Projects, and other community engagement mail lists you can manage this ex=
perience in one cohesive package=C2=A0=C2=A0</span></p></li></ul><br><ul st=
yle=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline">All resources created=
 in the legacy email system will be migrated and available cohesively with =
your new work in the new platform.=C2=A0 All URL links for assets in the ol=
d platform will redirect to the new location</span></p></li></ul><br><ul st=
yle=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline">After the migration y=
ou will be directed where to send future messages for this list and where t=
o find the archives.=C2=A0 You should update your bookmark and email contac=
t list accordingly</span></p></li></ul><br><ul style=3D"margin-top:0px;marg=
in-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt=
;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-al=
ternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline">After the migration you will be required to cre=
ate or login to an existing OASIS public community or member account to man=
age your subscriptions.=C2=A0 Legacy-style subscribe and unsubscribe email =
messages to the server will not be respected.</span></p></li></ul><br><br><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);=
background-color:transparent;font-weight:700;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:=
baseline">The Transition Schedule</span></p><br><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpare=
nt;font-weight:700;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline">This mail list w=
ill be offline 20-24 February. </span><span style=3D"font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">During the downtime you will not receive e=
mail messages sent to this list or have access to the archive.=C2=A0 Sender=
s will receive a reply pointing them to current migration status informatio=
n and where to find the new resources.</span></p><br><br><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-weight:700;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;vertical-align:baseline">What Yo=
u Should Do Now</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline">If you no longer wish to subscribe to this list, s=
end a message to [listname]</span><a href=3D"mailto:-unsubscribe@lists.oasi=
s-open.org" style=3D"text-decoration-line:none"><span style=3D"font-size:11=
pt;font-family:Arial,sans-serif;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;text-decoration-line:underline;vertical-align:baseline">-unsubscribe@lists=
.oasis-open.org</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">Otherwise, watch for further messages in the c=
oming days to include the new list mailing address and archive location.</s=
pan></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline">Feel free to contact me with any questions, and thanks for your pati=
ence with the inevitable short-term inconvenience implementing these improv=
ements will bring.</span></p></span><br class=3D"gmail-Apple-interchange-ne=
wline"><div><br></div><span class=3D"gmail_signature_prefix">-- </span><br>=
<div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatur=
e"><div dir=3D"ltr"><table cellspacing=3D"0" cellpadding=3D"0" style=3D"fon=
t-family:Arial;vertical-align:-webkit-baseline-middle"><tbody><tr><td width=
=3D"70" style=3D"vertical-align:middle"><span style=3D"margin-right:5px;dis=
play:block"><img width=3D"70" height=3D"70" style=3D"max-width:70px" src=3D=
"https://ci3.googleusercontent.com/mail-sig/AIorK4wWWvttK4QvAyLjmQRfbisd2jd=
vX84ncnFeBuJn9NtWvi8WHJIwVlm1HGm8Re2Ji0U6N10brtc"></span></td><td style=3D"=
vertical-align:middle"><h3 style=3D"margin:0px;font-size:16px;color:rgb(0,0=
,0)">Scott=C2=A0McGrath</h3><p style=3D"margin:0px;color:rgb(0,0,0);font-si=
ze:12px;line-height:20px">Chief Operating Officer</p><p style=3D"margin:0px=
;color:rgb(0,0,0);font-size:12px;line-height:20px">OASIS Open</p></td><td w=
idth=3D"30">=C2=A0</td><td width=3D"1" style=3D"width:1px;border-bottom:non=
e;border-left:1px solid rgb(34,72,229)">=C2=A0</td><td width=3D"30">=C2=A0<=
/td><td style=3D"vertical-align:middle"><table cellspacing=3D"0" cellpaddin=
g=3D"0" style=3D"vertical-align:-webkit-baseline-middle;font-family:Arial">=
<tbody><tr style=3D"vertical-align:middle"><td width=3D"30" style=3D"vertic=
al-align:middle"><table cellspacing=3D"0" cellpadding=3D"0" style=3D"vertic=
al-align:-webkit-baseline-middle;font-family:Arial"><tbody><tr><td style=3D=
"vertical-align:bottom"><span style=3D"display:block;background-color:rgb(3=
4,72,229)"><img src=3D"https://cdn2.hubspot.net/hubfs/53/tools/email-signat=
ure-generator/icons/phone-icon-2x.png" width=3D"13" style=3D"display:block"=
></span></td></tr></tbody></table></td><td style=3D"padding:2px;color:rgb(0=
,0,0)"><br>+1 781-929-7308 Mobile</td></tr><tr style=3D"vertical-align:midd=
le"><td width=3D"30" style=3D"vertical-align:middle"><table cellspacing=3D"=
0" cellpadding=3D"0" style=3D"vertical-align:-webkit-baseline-middle;font-f=
amily:Arial"><tbody><tr><td style=3D"vertical-align:bottom"><span style=3D"=
display:block;background-color:rgb(34,72,229)"><img src=3D"https://cdn2.hub=
spot.net/hubfs/53/tools/email-signature-generator/icons/email-icon-2x.png" =
width=3D"13" style=3D"display:block"></span></td></tr></tbody></table></td>=
<td style=3D"padding:2px"><a href=3D"mailto:scott.mcgrath@oasis-open.org" s=
tyle=3D"color:rgb(0,0,0);font-size:12px" target=3D"_blank">scott.mcgrath@oa=
sis-open.org</a></td></tr><tr style=3D"vertical-align:middle"><td width=3D"=
30" style=3D"vertical-align:middle"><table cellspacing=3D"0" cellpadding=3D=
"0" style=3D"vertical-align:-webkit-baseline-middle;font-family:Arial"><tbo=
dy><tr><td style=3D"vertical-align:bottom"><span style=3D"display:block;bac=
kground-color:rgb(34,72,229)"><img src=3D"https://cdn2.hubspot.net/hubfs/53=
/tools/email-signature-generator/icons/link-icon-2x.png" width=3D"13" style=
=3D"display:block"></span></td></tr></tbody></table></td><td style=3D"paddi=
ng:2px"><a href=3D"https://www.oasis-open.org/" style=3D"color:rgb(0,0,0);f=
ont-size:12px" target=3D"_blank">www.oasis-open.org</a></td></tr></tbody></=
table></td></tr></tbody></table></div></div></div>

--00000000000024a22a0610fad79e--
