Return-Path: <virtio-comment-return-8801-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3201AC4332F
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Dec 2023 17:51:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9060384E52
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Dec 2023 17:51:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7B3FB986B27
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Dec 2023 17:51:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 63F7D986A80; Thu, 14 Dec 2023 17:51:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F3D8D986A86
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Dec 2023 17:48:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702576053; x=1703180853;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pkWYtMgEnmrdwWvabQ3Fap0+LS37RWy5D+UO0HxffFg=;
        b=qRHu9s3HN3U3UQBas1ODD0qHaw/sKxWfAONcGKFWNviBvU4ivvVo0sbjsoq2hrY+tV
         n8yYUNDJn1fm3ZNtIFext6kWxw7v+XWmgRHmrTBmhape/GnCCrsuXJfp2n/sce8G6Dr+
         8w+h4JFnHJH+pVUscbkm2K5E5V+djwPijUv7jRqRqPDQhJypvHCzoVN9VxIECavR4PpN
         syEs8UpRg0niiBYy0f8AcecMabhGPP2v585zpoCsyda3S6lYIH5+KUeVEBQNd/y2M9+N
         dit8XioBcpNCqxvQXF0z/Wre/FgPcMnxSW9UBnTYPxsqdxkIcES8p5HFyVNtVKiGH4Y0
         Z3UA==
X-Gm-Message-State: AOJu0YxXBm1TmZ4mzWwtfpCV9spgl1aC783l0hWpF+0OvmrY2qBWH7mW
	YwaVQ8s1J9uSgleBkdc9PoaZXxzV0I7sRLI4dMzR/2P54oEq/UFfVc2gTNxe
X-Google-Smtp-Source: AGHT+IEfmygIu33ZhefyoRsMJf/vzFmMhTPi4fVMbz0hWjvnLwEspUlesbNRTKbF7giD6VNlAstGqQNlHEotFzqken0=
X-Received: by 2002:a92:c242:0:b0:35d:57f7:b27a with SMTP id
 k2-20020a92c242000000b0035d57f7b27amr12993112ilo.23.1702576032713; Thu, 14
 Dec 2023 09:47:12 -0800 (PST)
MIME-Version: 1.0
From: Scott McGrath <scott.mcgrath@oasis-open.org>
Date: Thu, 14 Dec 2023 12:47:00 -0500
Message-ID: <CAD2Xst-Pn9OwHsRNJrbe5C1Hfhy9egnDAvnXbK-fEK-+YwcdOg@mail.gmail.com>
To: amqp-bindmap-comment@lists.oasis-open.org, 
	amqp-comment@lists.oasis-open.org, arip-comment@lists.oasis-open.org, 
	asap-comment@lists.oasis-open.org, autorepair-comment@lists.oasis-open.org, 
	avdl-comment@lists.oasis-open.org, bcm-comment@lists.oasis-open.org, 
	bdx-comment@lists.oasis-open.org, bdxr-comment@lists.oasis-open.org, 
	bias-comment@lists.oasis-open.org, biometrics-comment@lists.oasis-open.org, 
	bioserv-comment@lists.oasis-open.org, 
	bpel4people-comment@lists.oasis-open.org, 
	business-transaction-comment@lists.oasis-open.org, 
	cacao-comment@lists.oasis-open.org, cam-comment@lists.oasis-open.org, 
	camp-comment@lists.oasis-open.org, ces-specs-comment@lists.oasis-open.org, 
	ces-tc-comment@lists.oasis-open.org, cgmo-webcgm-comment@lists.oasis-open.org, 
	ciq-comment@lists.oasis-open.org, cloudauthz-comment@lists.oasis-open.org, 
	cmis-comment@lists.oasis-open.org, cmis4dam-comment@lists.oasis-open.org, 
	codelist-comment@lists.oasis-open.org, coel-comment@lists.oasis-open.org, 
	conformance-comment@lists.oasis-open.org, 
	controlled-trade-comment@lists.oasis-open.org, 
	csaf-comment@lists.oasis-open.org, cti-comment@lists.oasis-open.org, 
	cxs-comment@lists.oasis-open.org, cyber-council-comment@lists.oasis-open.org, 
	dcml-adoption-comment@lists.oasis-open.org, 
	dcml-appserv-comment@lists.oasis-open.org, 
	dcml-frame-comment@lists.oasis-open.org, 
	dcml-network-comment@lists.oasis-open.org, 
	dcml-server-comment@lists.oasis-open.org, 
	dita-adoption-comment@lists.oasis-open.org, dita-comment@lists.oasis-open.org, 
	docbook-comment@lists.oasis-open.org, dsml-comment@lists.oasis-open.org, 
	dss-comment@lists.oasis-open.org, dss-x-comment@lists.oasis-open.org, 
	ebcore-comment@lists.oasis-open.org, ebsoa-comment@lists.oasis-open.org, 
	ebxml-bp-comment@lists.oasis-open.org, 
	ebxml-cppa-comment@lists.oasis-open.org, 
	ebxml-iic-comment@lists.oasis-open.org, ebxml-jc-comment@lists.oasis-open.org, 
	ebxml-msg-comment@lists.oasis-open.org, 
	education-comment@lists.oasis-open.org, egov-comment@lists.oasis-open.org, 
	ekmi-comment@lists.oasis-open.org, 
	election-services-comment@lists.oasis-open.org, 
	emergency-adopt-comment@lists.oasis-open.org, 
	emergency-comment@lists.oasis-open.org, emix-comment@lists.oasis-open.org, 
	energyinterop-comment@lists.oasis-open.org, 
	entity-resolution-comment@lists.oasis-open.org, 
	eps-comment@lists.oasis-open.org, esat-comment@lists.oasis-open.org, 
	etmf-comment@lists.oasis-open.org, ffm-comment@lists.oasis-open.org, 
	foo-comment@lists.oasis-open.org, forest-comment@lists.oasis-open.org, 
	fwsi-comment@lists.oasis-open.org, geolang-comment@lists.oasis-open.org, 
	humanmarkup-comment@lists.oasis-open.org, ibops-comment@lists.oasis-open.org, 
	icom-comment@lists.oasis-open.org, id-cloud-comment@lists.oasis-open.org, 
	idpf-comment@lists.oasis-open.org, ihc-comment@lists.oasis-open.org, 
	imi-comment@lists.oasis-open.org, kmip-comment@lists.oasis-open.org, 
	kvdb-comment@lists.oasis-open.org, legalcitem-comment@lists.oasis-open.org, 
	legaldocml-comment@lists.oasis-open.org, 
	legalruleml-comment@lists.oasis-open.org, 
	legalxml-comment@lists.oasis-open.org, 
	legalxml-courtfiling-comment@lists.oasis-open.org, 
	legalxml-econtracts-comment@lists.oasis-open.org, 
	legalxml-enotary-comment@lists.oasis-open.org, 
	legalxml-intercept-comment@lists.oasis-open.org, 
	legalxml-intjustice-comment@lists.oasis-open.org, 
	legalxml-legislative-comment@lists.oasis-open.org, 
	legalxml-odr-comment@lists.oasis-open.org, 
	legalxml-sdhi-comment@lists.oasis-open.org, 
	legalxml-transcripts-comment@lists.oasis-open.org, 
	lexidma-comment@lists.oasis-open.org, lp-comment@lists.oasis-open.org, 
	lvcsp-comment@lists.oasis-open.org, materials-comment@lists.oasis-open.org, 
	mgmtprotocol-comment@lists.oasis-open.org, mqtt-comment@lists.oasis-open.org, 
	new-comment-sample@lists.oasis-open.org, 
	oasis-board-comment@lists.oasis-open.org, 
	oasis-member-practice-comment@lists.oasis-open.org, 
	oaxal-comment@lists.oasis-open.org, obix-comment@lists.oasis-open.org, 
	ocpp-comment@lists.oasis-open.org, odata-comment@lists.oasis-open.org, 
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
Content-Type: multipart/alternative; boundary="000000000000a22697060c7bdfa0"
Subject: [virtio-comment] Updated schedule for OASIS mail list system upgrade

--000000000000a22697060c7bdfa0
Content-Type: text/plain; charset="UTF-8"

We Recently announced the migration to a new List Mail system for this
list. We've modified the implementation process to allow the legacy system
to continue running a bit longer and to have a shorter downtime during
transition.


*The system cut-over is now scheduled for the first week of January *


Miss the original announcement?  Here it is...

The legacy list engine in use since 2003 will be replaced in this upgrade.
You are receiving this message because you are a subscriber to the list
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

   Modern web interface and design for your committee internal work and
   public presentation of your work



   -

   If you are on this public list in addition to Technical Committees, Open
   Projects, and other community engagement mail lists you can manage this
   experience in one cohesive package



   -

   All archives created in the legacy email system will be migrated and
   available cohesively with your new work in the new platform.  All URL links
   for assets in the old platform will redirect to the new location



   -

   After the cutover starts, you will be directed where to send future
   messages for this list and where to find the archives. Any message sent to
   a legacy list address after the cutover begins will receive an auto reply
   with the new list address and archive location.



   -

   After the migration you can continue using the mail list as before. If
   you wish to join additional public lists or modify your delivery to the new
   digest delivery, you will be required to create or login to an existing
   OASIS public community or member account to manage your subscriptions.
   This account system will be used to confirm your email address once (as
   opposed to each subscription) and will be the same account you may be using
   now for OASIS membership, submitting e-CLA forms etc. Legacy-style
   subscribe and unsubscribe email messages to the server will not be
   respected in the new system.



The Transition Schedule

During the cut-over the first week of January, There will be some system
downtime during the cutover. During the downtime you will not receive email
messages sent to this list or have access to the archive.  All messages
sent after the cut-over begins will receive an auto reply announcing the
new list address and archive location.

We will announce the timing specific as we get closer to the transition.

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

--000000000000a22697060c7bdfa0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-64dc5fe4-7fff-eafa-5d=
8c-6960ff2ec20d"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">We Recently announced the migration to a new List Mail system f=
or this list.  We&#39;ve modified the implementation process to allow the l=
egacy system to continue running a bit longer and to have a shorter downtim=
e during transition.</span></p><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline"><br></span></p><p style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Aria=
l,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;v=
ertical-align:baseline"><b>The system cut-over is now scheduled for the fir=
st week of January=C2=A0</b></span></p><div><span><br></span></div><div><sp=
an><br></span></div>Miss the original announcement?=C2=A0 Here it is...</sp=
an><div><span><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline">The legacy list engine in use since 2003 will be replaced in t=
his upgrade.=C2=A0 You are receiving this message because you are a subscri=
ber to the list receiving this message.</span></p><br><p dir=3D"ltr" style=
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
gin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">Mail systems that you can depend on!=C2=A0 The=
 new tools support and comply with major deliverability and anti-spoofing s=
tandards.=C2=A0 This will eliminate many of the sending and deliverability =
issues your group may be experiencing</span></p></li></ul><br><ul style=3D"=
margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
 role=3D"presentation"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;vertical-align:baseline">Modern web interface and des=
ign for your committee internal work and public presentation of your work</=
span></p></li></ul><br><ul style=3D"margin-top:0px;margin-bottom:0px"><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">If you are on this public list in addition to Technical Committees,=
 Open Projects, and other community engagement mail lists you can manage th=
is experience in one cohesive package=C2=A0=C2=A0</span></p></li></ul><br><=
ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline">All archives cre=
ated in the legacy email system will be migrated and available cohesively w=
ith your new work in the new platform.=C2=A0 All URL links for assets in th=
e old platform will redirect to the new location</span></p></li></ul><br><u=
l style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;font-variant-alternates:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;font-variant-alternates:normal;vertical-align:baseline">After the cutover=
 starts, you will be directed where to send future messages for this list a=
nd where to find the archives.  Any message sent to a legacy list address a=
fter the cutover begins will receive an auto reply with the new list addres=
s and archive location.</span></p></li></ul><br><ul style=3D"margin-top:0px=
;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">After the migration you can continue using=
 the mail list as before.  If you wish to join additional public lists or m=
odify your delivery to the new digest delivery, you will be required to cre=
ate or login to an existing OASIS public community or member account to man=
age your subscriptions.=C2=A0 This account system will be used to confirm y=
our email address once (as opposed to each subscription) and will be the sa=
me account you may be using now for OASIS membership, submitting e-CLA form=
s etc.   Legacy-style subscribe and unsubscribe email messages to the serve=
r will not be respected in the new system.</span></p></li></ul><br><br><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-weight:700;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline">The Transition Schedule</span></p><br><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;vertical-align:baseline">During the cut-over the first week =
of January,  There will be some system downtime during the cutover. During =
the downtime you will not receive email messages sent to this list or have =
access to the archive.=C2=A0=C2=A0All messages sent after the cut-over begi=
ns will receive an auto reply announcing the new list address and archive l=
ocation.</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans=
-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline">We will announce the timing specific as we get closer to =
the transition.</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:700=
;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-al=
ternates:normal;vertical-align:baseline">What You Should Do Now</span></p><=
br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">If=
 you no longer wish to subscribe to this list, send a message to [listname]=
</span><a href=3D"mailto:-unsubscribe@lists.oasis-open.org" style=3D"text-d=
ecoration-line:none"><span style=3D"font-size:11pt;font-family:Arial,sans-s=
erif;background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-variant-alternates:normal;text-decoration-line:under=
line;vertical-align:baseline">-unsubscribe@lists.oasis-open.org</span></a><=
/p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
">Otherwise, watch for further messages in the coming days to include the n=
ew list mailing address and archive location.</span></p><br><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline">Feel free to contact=
 me with any questions, and thanks for your patience with the inevitable sh=
ort-term inconvenience implementing these improvements will bring.</span></=
p><br></span><div><br></div><span class=3D"gmail_signature_prefix">-- </spa=
n><br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr"><table cellspacing=3D"0" cellpadding=3D"0" style=
=3D"font-family:Arial;vertical-align:-webkit-baseline-middle"><tbody><tr><t=
d width=3D"70" style=3D"vertical-align:middle"><span style=3D"margin-right:=
5px;display:block"><img width=3D"70" height=3D"70" style=3D"max-width:70px"=
 src=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4wWWvttK4QvAyLjmQRf=
bisd2jdvX84ncnFeBuJn9NtWvi8WHJIwVlm1HGm8Re2Ji0U6N10brtc"></span></td><td st=
yle=3D"vertical-align:middle"><h3 style=3D"margin:0px;font-size:16px;color:=
rgb(0,0,0)">Scott=C2=A0McGrath</h3><p style=3D"margin:0px;color:rgb(0,0,0);=
font-size:12px;line-height:20px">Chief Operating Officer</p><p style=3D"mar=
gin:0px;color:rgb(0,0,0);font-size:12px;line-height:20px">OASIS Open</p></t=
d><td width=3D"30">=C2=A0</td><td width=3D"1" style=3D"width:1px;border-bot=
tom:none;border-left:1px solid rgb(34,72,229)">=C2=A0</td><td width=3D"30">=
=C2=A0</td><td style=3D"vertical-align:middle"><table cellspacing=3D"0" cel=
lpadding=3D"0" style=3D"vertical-align:-webkit-baseline-middle;font-family:=
Arial"><tbody><tr style=3D"vertical-align:middle"><td width=3D"30" style=3D=
"vertical-align:middle"><table cellspacing=3D"0" cellpadding=3D"0" style=3D=
"vertical-align:-webkit-baseline-middle;font-family:Arial"><tbody><tr><td s=
tyle=3D"vertical-align:bottom"><span style=3D"display:block;background-colo=
r:rgb(34,72,229)"><img src=3D"https://cdn2.hubspot.net/hubfs/53/tools/email=
-signature-generator/icons/phone-icon-2x.png" width=3D"13" style=3D"display=
:block"></span></td></tr></tbody></table></td><td style=3D"padding:2px;colo=
r:rgb(0,0,0)"><br>+1 781-929-7308 Mobile</td></tr><tr style=3D"vertical-ali=
gn:middle"><td width=3D"30" style=3D"vertical-align:middle"><table cellspac=
ing=3D"0" cellpadding=3D"0" style=3D"vertical-align:-webkit-baseline-middle=
;font-family:Arial"><tbody><tr><td style=3D"vertical-align:bottom"><span st=
yle=3D"display:block;background-color:rgb(34,72,229)"><img src=3D"https://c=
dn2.hubspot.net/hubfs/53/tools/email-signature-generator/icons/email-icon-2=
x.png" width=3D"13" style=3D"display:block"></span></td></tr></tbody></tabl=
e></td><td style=3D"padding:2px"><a href=3D"mailto:scott.mcgrath@oasis-open=
.org" style=3D"color:rgb(0,0,0);font-size:12px" target=3D"_blank">scott.mcg=
rath@oasis-open.org</a></td></tr><tr style=3D"vertical-align:middle"><td wi=
dth=3D"30" style=3D"vertical-align:middle"><table cellspacing=3D"0" cellpad=
ding=3D"0" style=3D"vertical-align:-webkit-baseline-middle;font-family:Aria=
l"><tbody><tr><td style=3D"vertical-align:bottom"><span style=3D"display:bl=
ock;background-color:rgb(34,72,229)"><img src=3D"https://cdn2.hubspot.net/h=
ubfs/53/tools/email-signature-generator/icons/link-icon-2x.png" width=3D"13=
" style=3D"display:block"></span></td></tr></tbody></table></td><td style=
=3D"padding:2px"><a href=3D"https://www.oasis-open.org/" style=3D"color:rgb=
(0,0,0);font-size:12px" target=3D"_blank">www.oasis-open.org</a></td></tr><=
/tbody></table></td></tr></tbody></table></div></div></div></div>

--000000000000a22697060c7bdfa0--
