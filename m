Return-Path: <virtio-comment-return-8741-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8197C4167B
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 00:15:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E195A41F53
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 00:15:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D72C1986948
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 00:15:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BC1E5986938; Wed,  6 Dec 2023 00:15:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 98291986968
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Dec 2023 00:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701821724; x=1702426524;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kw9Rv7Yyw/bg4/kWlZ5CYCKhwDvzV5EdEeGZLupafvo=;
        b=jZ0pbaC6RWt/3DeSlFwD8d4EwyJY/sXRH3pYN/0tLVqMeOZkE+SYV7/waiAiLPG81i
         EGoZvIIL5K7jA0JHy8GnwZKdx1ZISNKUfwerQCFD+hSfBzo/Gb7zioJ13KdKSpj6zJPz
         niVPnPTtE3aLgpbMMP+RCIgN6H6fULAUvVsUwsjZbYJW1h2NrAEpYK4WaQgAj79j7suP
         /aobhwvY04oYtexJFvWkBAtdGP7+RUngPskCih8uZm1oapoikkmVFVEymFprL524Nj+g
         PhmyTV/JsajjQaZoocYcyxuORkzNLifDMWTjbJIMiZKSxz6MP6S+Y61Buj3fsKch0zid
         oE7w==
X-Gm-Message-State: AOJu0YwWM55BTKvoPe4f5ihaPOZKVGMY9SbEiSDDIHjIEWUwuHKxfvDe
	ttqT5W9FExb9kFz5kw18yAvJmnIWFzJPmLENqmycTpgJY1DfgE90Vq3t6tN3
X-Google-Smtp-Source: AGHT+IHUtrJIxZ44r69tuOqBnig7B7xfb+dklRhtS2fgtYlqBRvXIqKE5kRLJNYFleUbgZQEoVEweWplAs4TxBixHoc=
X-Received: by 2002:a25:c8a:0:b0:db7:dacf:59ea with SMTP id
 132-20020a250c8a000000b00db7dacf59eamr4750200ybm.94.1701821703435; Tue, 05
 Dec 2023 16:15:03 -0800 (PST)
MIME-Version: 1.0
From: Scott McGrath <scott.mcgrath@oasis-open.org>
Date: Tue, 5 Dec 2023 19:14:50 -0500
Message-ID: <CAD2Xst-H_xBEyaM7R=bygwVafWUfGNADEdXq0F6drAD1rKy4zg@mail.gmail.com>
To: ocpp-comment@lists.oasis-open.org, odata-comment@lists.oasis-open.org, 
	odf-adoption-comment@lists.oasis-open.org, 
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
	xslt-conformance-comment@lists.oasis-open.org
Content-Type: multipart/alternative; boundary="0000000000001acfc7060bcc3e03"
Subject: [virtio-comment] Changes coming to this mail list system

--0000000000001acfc7060bcc3e03
Content-Type: text/plain; charset="UTF-8"

I am very pleased to announce a new List Mail system will be implemented
for this list shortly.

The legacy list engine in use since 2003 will be replaced in December.  You
are receiving this message because you are a subscriber to the list
receiving this message.

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

   If you are on this public list in addition to Technical Committees, Open
   Projects, and other community engagement mail lists you can manage this
   experience in one cohesive package



   -

   All resources created in the legacy email system will be migrated and
   available cohesively with your new work in the new platform.  All URL links
   for assets in the old platform will redirect to the new location



   -

   After the migration you will be directed where to send future messages
   for this list and where to find the archives.



   -

   After the migration you will be required to create or login to an
   existing OASIS public community or member account to manage your
   subscriptions.  Legacy-style subscribe and unsubscribe email messages to
   the server will not be respected.



The Transition Schedule

Starting 14 December, there may be as much as several days of system
downtime. During the downtime you will not receive email messages sent to
this list or have access to the archive.

We will announce the timing specific as we get closer to the transition.

What You Should Do Now

If you no longer wish to subscribe to this list, send a message to

[listname]-unsubscribe@lists.oasis-open.org

Otherwise, watch for further messages in the coming days to include the new
list mailing address and archive location.

Feel free to contact me with any questions, and thanks for your patience
with the inevitable short-term inconvenience implementing these
improvements will bring.

Scott...


-- 
Scott McGrath

Chief Operating Officer

OASIS Open


+1 781-929-7308 Mobile
scott.mcgrath@oasis-open.org
www.oasis-open.org

--0000000000001acfc7060bcc3e03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"m_7439167174213750436m_-9022550266226993129gma=
il-docs-internal-guid-a2e49186-7fff-d1d6-b8f0-259f621a0ee3"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline">I am very pleased to=
 announce a new List Mail system will be implemented for this list shortly.=
=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-=
align:baseline">The legacy list engine in use since 2003 will be replaced i=
n December.=C2=A0 You are receiving this message because you are a subscrib=
er to the list receiving this message.</span></p><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-v=
ariant-alternates:normal;vertical-align:baseline">This transition will prov=
ide significant improvements and will change how you interact with your mai=
l lists.=C2=A0 See below for more information about the changes, the transi=
tion schedule and what you can do to help.</span></p><br><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-weight:700;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;vertical-align:baseline">Changes=
 to Expect</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;font-variant-alternates:normal;verti=
cal-align:baseline">The new platform is built in a modern web environment a=
nd mail delivery mechanism. with a number of new features to improve both y=
our platform user experience and ability to engage with the OASIS community=
.=C2=A0 Key features include:</span></p><br><ul style=3D"margin-top:0px;mar=
gin-bottom:0px"><li dir=3D"ltr" style=3D"margin-left:15px;list-style-type:d=
isc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline"><p dir=3D"ltr" r=
ole=3D"presentation" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline">Mail systems that you can depend on!=C2=A0 Th=
e new tools support and comply with major deliverability and anti-spoofing =
standards.=C2=A0 This will eliminate many of the sending and deliverability=
 issues your group may be experiencing</span></p></li></ul><font color=3D"#=
000000" face=3D"Arial, sans-serif"><span style=3D"font-size:14.6667px"><br>=
</span></font><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr=
" style=3D"margin-left:15px;list-style-type:disc;font-size:11pt;font-family=
:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline"><p dir=3D"ltr" role=3D"presentation" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">=
If you are on this public list in addition to Technical Committees, Open Pr=
ojects, and other community engagement mail lists you can manage this exper=
ience in one cohesive package=C2=A0=C2=A0</span></p></li></ul><br><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"margin-left:=
15px;list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line"><p dir=3D"ltr" role=3D"presentation" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline">All resources created i=
n the legacy email system will be migrated and available cohesively with yo=
ur new work in the new platform.=C2=A0 All URL links for assets in the old =
platform will redirect to the new location</span></p></li></ul><br><ul styl=
e=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"margin-left=
:15px;list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline"><p dir=3D"ltr" role=3D"presentation" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">After the migration yo=
u will be directed where to send future messages for this list and where to=
 find the archives.</span></p></li></ul><br><ul style=3D"margin-top:0px;mar=
gin-bottom:0px"><li dir=3D"ltr" style=3D"margin-left:15px;list-style-type:d=
isc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline"><p dir=3D"ltr" r=
ole=3D"presentation" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;vertical-align:baseline">After the migration you will be required to c=
reate or login to an existing OASIS public community or member account to m=
anage your subscriptions.=C2=A0 Legacy-style subscribe and unsubscribe emai=
l messages to the server will not be respected.</span></p></li></ul><br><br=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-weight:700;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">The Transition Schedule</span></p><br><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline">Starting 14 December, there ma=
y be as much as several days of system downtime. During the downtime you wi=
ll not receive email messages sent to this list or have access to the archi=
ve.=C2=A0=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline">We will announce the timing specific as we get clo=
ser to the transition.</span></p><br><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fam=
ily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-wei=
ght:700;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline">What You Should Do Now</spa=
n></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine">If you no longer wish to subscribe to this list, send a message to=C2=
=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline">[listname]</span><a href=3D"mailto:-unsubscribe@lists.oasis-open.o=
rg" target=3D"_blank" style=3D"text-decoration-line:none"><span style=3D"fo=
nt-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alterna=
tes:normal;text-decoration-line:underline;vertical-align:baseline">-unsubsc=
ribe@lists.oasis-open.org</span></a></p><br><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;f=
ont-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alte=
rnates:normal;vertical-align:baseline">Otherwise, watch for further message=
s in the coming days to include the new list mailing address and archive lo=
cation.</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical=
-align:baseline">Feel free to contact me with any questions, and thanks for=
 your patience with the inevitable short-term inconvenience implementing th=
ese improvements will bring.</span></p></span><br><div>Scott...</div><div><=
br></div><div><br></div><span class=3D"gmail_signature_prefix">-- </span><b=
r><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signat=
ure"><div dir=3D"ltr"><table cellspacing=3D"0" cellpadding=3D"0" style=3D"f=
ont-family:Arial;vertical-align:-webkit-baseline-middle"><tbody><tr><td wid=
th=3D"70" style=3D"vertical-align:middle"><span style=3D"margin-right:5px;d=
isplay:block"><img width=3D"70" height=3D"70" style=3D"max-width:70px" src=
=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4wWWvttK4QvAyLjmQRfbisd=
2jdvX84ncnFeBuJn9NtWvi8WHJIwVlm1HGm8Re2Ji0U6N10brtc"></span></td><td style=
=3D"vertical-align:middle"><h3 style=3D"margin:0px;font-size:16px;color:rgb=
(0,0,0)">Scott=C2=A0McGrath</h3><p style=3D"margin:0px;color:rgb(0,0,0);fon=
t-size:12px;line-height:20px">Chief Operating Officer</p><p style=3D"margin=
:0px;color:rgb(0,0,0);font-size:12px;line-height:20px">OASIS Open</p></td><=
td width=3D"30">=C2=A0</td><td width=3D"1" style=3D"width:1px;border-bottom=
:none;border-left:1px solid rgb(34,72,229)">=C2=A0</td><td width=3D"30">=C2=
=A0</td><td style=3D"vertical-align:middle"><table cellspacing=3D"0" cellpa=
dding=3D"0" style=3D"vertical-align:-webkit-baseline-middle;font-family:Ari=
al"><tbody><tr style=3D"vertical-align:middle"><td width=3D"30" style=3D"ve=
rtical-align:middle"><table cellspacing=3D"0" cellpadding=3D"0" style=3D"ve=
rtical-align:-webkit-baseline-middle;font-family:Arial"><tbody><tr><td styl=
e=3D"vertical-align:bottom"><span style=3D"display:block;background-color:r=
gb(34,72,229)"><img src=3D"https://cdn2.hubspot.net/hubfs/53/tools/email-si=
gnature-generator/icons/phone-icon-2x.png" width=3D"13" style=3D"display:bl=
ock"></span></td></tr></tbody></table></td><td style=3D"padding:2px;color:r=
gb(0,0,0)"><br>+1 781-929-7308 Mobile</td></tr><tr style=3D"vertical-align:=
middle"><td width=3D"30" style=3D"vertical-align:middle"><table cellspacing=
=3D"0" cellpadding=3D"0" style=3D"vertical-align:-webkit-baseline-middle;fo=
nt-family:Arial"><tbody><tr><td style=3D"vertical-align:bottom"><span style=
=3D"display:block;background-color:rgb(34,72,229)"><img src=3D"https://cdn2=
.hubspot.net/hubfs/53/tools/email-signature-generator/icons/email-icon-2x.p=
ng" width=3D"13" style=3D"display:block"></span></td></tr></tbody></table><=
/td><td style=3D"padding:2px"><a href=3D"mailto:scott.mcgrath@oasis-open.or=
g" style=3D"color:rgb(0,0,0);font-size:12px" target=3D"_blank">scott.mcgrat=
h@oasis-open.org</a></td></tr><tr style=3D"vertical-align:middle"><td width=
=3D"30" style=3D"vertical-align:middle"><table cellspacing=3D"0" cellpaddin=
g=3D"0" style=3D"vertical-align:-webkit-baseline-middle;font-family:Arial">=
<tbody><tr><td style=3D"vertical-align:bottom"><span style=3D"display:block=
;background-color:rgb(34,72,229)"><img src=3D"https://cdn2.hubspot.net/hubf=
s/53/tools/email-signature-generator/icons/link-icon-2x.png" width=3D"13" s=
tyle=3D"display:block"></span></td></tr></tbody></table></td><td style=3D"p=
adding:2px"><a href=3D"https://www.oasis-open.org/" style=3D"color:rgb(0,0,=
0);font-size:12px" target=3D"_blank">www.oasis-open.org</a></td></tr></tbod=
y></table></td></tr></tbody></table></div></div></div>

--0000000000001acfc7060bcc3e03--
