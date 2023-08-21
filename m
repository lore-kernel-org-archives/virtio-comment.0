Return-Path: <virtio-comment-return-7215-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF92EE49AA
	for <virtio-comment@archiver.kernel.org>; Mon, 21 Aug 2023 22:20:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7D0E871628
	for <virtio-comment@archiver.kernel.org>; Mon, 21 Aug 2023 22:20:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5BF11986377
	for <virtio-comment@archiver.kernel.org>; Mon, 21 Aug 2023 22:20:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 444CB983D6C; Mon, 21 Aug 2023 22:20:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D4A93986351
	for <virtio-comment@lists.oasis-open.org>; Mon, 21 Aug 2023 22:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692656357; x=1693261157;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9Fpcs+dXkCDVF8Jv+BOvaN9jG5QSmJkBIxP60EmVa0=;
        b=ERLTiL1QeytLMiV9sGCw7R2wx9t1VLSZJ+B/w8X2eCrzGhPtFHQhdA6vwrLPzgaEBF
         vcsUBGvobkjfBsQRVRRxJODtdPWTzfZyTe0aQfAiXq6/1xA52z7B+JYfHXJFHxVg3g4q
         dowRvJOazuJgZftUFy42mXJ4+lNjuTVZejAZBx15rOofFsPovjdlpXdz9bDFWxA4PteD
         4OnZju3z154Eya8h+8/xTtJXQtDH7vGII+H32GLGvFvMolDzde3XBP1npoZfCvQc+k/M
         XP2IQeKITiKcS1k2mPG2efi81era4BP4D2nVcIroQMBx83012NgRkaBfh7FROSd/XIhS
         KSAg==
X-Gm-Message-State: AOJu0Yxla9x++e4ltjdngLNsjAJOtI9qcxCp+uid541V+h99UMk80tgW
	6HIJe7j9cYdJy9tnpOkwUcVy/f6wszGsA+cwQFY=
X-Google-Smtp-Source: AGHT+IElV2I1p2aPZM0lesQDGInYEHeSxekMnvh+/JPh57R/mqOUSNO9qkIDdpo5J2vrQQUntmYxqw==
X-Received: by 2002:a17:906:5a55:b0:99b:b867:4972 with SMTP id my21-20020a1709065a5500b0099bb8674972mr6311015ejc.35.1692656357041;
        Mon, 21 Aug 2023 15:19:17 -0700 (PDT)
X-Received: by 2002:a17:906:5385:b0:994:4095:3abf with SMTP id
 g5-20020a170906538500b0099440953abfmr6289434ejo.14.1692656356026; Mon, 21 Aug
 2023 15:19:16 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Mon, 21 Aug 2023 15:18:50 -0700
X-Gmail-Original-Message-ID: <CABVzXAke4LRt4=S4FsFTFf_WPrAhe1dukoLZto6t6R13kgjw0Q@mail.gmail.com>
Message-ID: <CABVzXAke4LRt4=S4FsFTFf_WPrAhe1dukoLZto6t6R13kgjw0Q@mail.gmail.com>
To: virtio-comment@lists.oasis-open.org
Cc: virtualization@lists.linux-foundation.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d4ab790603764491"
Subject: [virtio-comment] virtio queue numbering and optional queues

--000000000000d4ab790603764491
Content-Type: text/plain; charset="UTF-8"

Hello virtio folks,

I noticed a mismatch between the way the specification defines
device-specific virtqueue indexes and the way device and driver
implementers have interpreted the specification. As a practical example,
consider the traditional memory balloon device [1]. The first two queues
(indexes 0 and 1) are available as part of the baseline device, but the
rest of the queues are tied to feature bits.

Section 5.5.2, "Virtqueues", gives a list that appears to be a mapping from
queue index to queue name/function, defining queue index 3 as free_page_vq
and index 4 as reporting_vq, and declaring that "free_page_vq only exists
if VIRTIO_BALLOON_F_FREE_PAGE_HINT is set" and "reporting_vq only exists if
VIRTIO_BALLOON_F_PAGE_REPORTING is set." This wording is a bit vague, but I
assume "is set" means "is negotiated" (not just "advertised by the
device"). Also presumably "exists" means something like "may only be used
by the driver if the feature bit is negotiated" and "should be ignored by
the device if the feature bit is not negotiated", although it would be nice
to have a proper definition in the spec somewhere.

Section 5.5.3, "Feature bits", gives definitions of the feature bits, with
similar descriptions of the relationship between the feature bits and
virtqueue availability, although the wording is slightly different
("present" rather than "exists"). No dependency between feature bits is
defined, so it seems like it should be valid for a device or driver to
support or accept one of the higher-numbered features while not supporting
a lower-numbered one.


Notably, there is no mention of queue index assignments changing based on
negotiated features in either of these sections. Hence a reader can only
assume that the queue index assignments are fixed (i.e. stats_vq will
always be vq index 4 if F_STATS_VQ is negotiated, regardless of any other
feature bits).

Now consider a scenario where VIRTIO_BALLOON_F_STATS_VQ and
VIRTIO_BALLOON_F_PAGE_REPORTING are negotiated but
VIRTIO_BALLOON_F_FREE_PAGE_HINT is not (perhaps the device supports all of
the defined features but the driver only wants to use reporting_vq, not
free_page_vq). In this case, what queue index should be used by the driver
when enabling reporting_vq? My reading of the specification is that the
reporting_vq is always queue index 4, independent of whether
VIRTIO_BALLOON_F_STATS_VQ or VIRTIO_BALLOON_F_FREE_PAGE_HINT are
negotiated, but this contradicts existing device and driver
implementations, which will use queue index 3 (the next one after stats_vq
= 2) as reporting_vq in this case.

The qemu virtio-ballon device [2] assigns the next-highest unused queue
index when calling virtio_add_queue(), and in the scenario presented above,
free_page_vq will not be added since F_STATS_VQ is not negotiated, so
reporting_vq will be assigned queue index 3, rather than 4. (Additionally,
qemu always adds the stats_vq regardless of negotiated features, but that's
irrelevant in this case since we are assuming the STATS_VQ feature is
negotiated.)

The Linux virtio driver code originally seemed to use the correct (by my
reading) indexes, but it was changed to match the layout used by qemu in a
2019 commit ("virtio_pci: use queue idx instead of array idx to set up the
vq") [3] - in other words, it will now also expect queue index 3 to be
reporting_vq in the scenario laid out above.

I'm not sure how to resolve the mismatch between the specification and
actual implementation behavior. The simplest change would probably be to
rewrite the specification to drop the explicit queue indexes in section
5.5.2 and add some wording about how queues are numbered based on
negotiated feature bits (this would need to be applied to other device
types that have specified queue indexes as well). However, this would also
technically be an incompatible change of the specification. On the other
hand, changing the device and driver implementations to match the
specification would be even more challenging, since it would be an
incompatible change in actual practice, not just a change of the spec to
match consensus implementation behavior.


Perhaps drivers could add a quirk to detect old versions of the qemu device
and use the old behavior, while enabling the correct behavior only for
other device vendors and newer qemu device revisions, and the qemu device
could add an opt-in feature to enable the correct behavior that users would
need to enable only when they know they have a sufficiently new driver with
the fix.


Or maybe there could be a new feature bit that would opt into following the
spec-defined queue indexes (VIRTIO_F_VERSION_2?) and some new wording to
require devices to use the old behavior when that bit is not negotiated,
but that also feels less than ideal to me.

Any thoughts on how to proceed with this situation? Is my reading of the
specification just wrong?

Thanks,

-- Daniel

[1]:
https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html#x1-3160002

[2]:
https://github.com/qemu/qemu/blob/f33c74576425fac2cbb0725229895fe096df4261/hw/virtio/virtio-balloon.c#L879-L897

[3]:
https://github.com/torvalds/linux/commit/ddbeac07a39a81d82331a312d0578fab94fccbf1

--000000000000d4ab790603764491
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-8ae35d77-7fff-08ec-06=
e3-f3303f9f6f73"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">Hello virtio folks,</span></p><br><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-al=
ternates:normal;vertical-align:baseline">I noticed a mismatch between the w=
ay the specification defines device-specific virtqueue indexes and the way =
device and driver implementers have interpreted the specification. As a pra=
ctical example, consider the traditional memory balloon device [1]. The fir=
st two queues (indexes 0 and 1) are available as part of the baseline devic=
e, but the rest of the queues are tied to feature bits.</span></p><br><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline">Section 5.=
5.2, &quot;Virtqueues&quot;, gives a list that appears to be a mapping from=
 queue index to queue name/function, defining queue index 3 as free_page_vq=
 and index 4 as reporting_vq, and declaring that &quot;free_page_vq only ex=
ists if VIRTIO_BALLOON_F_FREE_PAGE_HINT is set&quot; and &quot;reporting_vq=
 only exists if VIRTIO_BALLOON_F_PAGE_REPORTING is set.&quot; This wording =
is a bit vague, but I assume &quot;is set&quot; means &quot;is negotiated&q=
uot; (not just &quot;advertised by the device&quot;). Also presumably &quot=
;exists&quot; means something like &quot;may only be used by the driver if =
the feature bit is negotiated&quot; and &quot;should be ignored by the devi=
ce if the feature bit is not negotiated&quot;, although it would be nice to=
 have a proper definition in the spec somewhere.</span></p><br><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline">Section 5.5.3, &=
quot;Feature bits&quot;, gives definitions of the feature bits, with simila=
r descriptions of the relationship between the feature bits and virtqueue a=
vailability, although the wording is slightly different (&quot;present&quot=
; rather than &quot;exists&quot;). No dependency between feature bits is de=
fined, so it seems like it should be valid for a device or driver to suppor=
t or accept one of the higher-numbered features while not supporting a lowe=
r-numbered one.</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline"><br></span></p><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline">Notably, there is no mention of queue index =
assignments changing based on negotiated features in either of these sectio=
ns. Hence a reader can only assume that the queue index assignments are fix=
ed (i.e. stats_vq will always be vq index 4 if F_STATS_VQ is negotiated, re=
gardless of any other feature bits).</span></p><br><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline">Now consider a scenario where=
 VIRTIO_BALLOON_F_STATS_VQ and VIRTIO_BALLOON_F_PAGE_REPORTING are negotiat=
ed but VIRTIO_BALLOON_F_FREE_PAGE_HINT is not (perhaps the device supports =
all of the defined features but the driver only wants to use reporting_vq, =
not free_page_vq). In this case, what queue index should be used by the dri=
ver when enabling reporting_vq? My reading of the specification is that the=
 reporting_vq is always queue index 4, independent of whether VIRTIO_BALLOO=
N_F_STATS_VQ or VIRTIO_BALLOON_F_FREE_PAGE_HINT are negotiated, but this co=
ntradicts existing device and driver implementations, which will use queue =
index 3 (the next one after stats_vq =3D 2) as reporting_vq in this case.</=
span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">The qemu virtio-ballon device [2] assigns the next-highest unused q=
ueue index when calling virtio_add_queue(), and in the scenario presented a=
bove, free_page_vq will not be added since F_STATS_VQ is not negotiated, so=
 reporting_vq will be assigned queue index 3, rather than 4. (Additionally,=
 qemu always adds the stats_vq regardless of negotiated features, but that&=
#39;s irrelevant in this case since we are assuming the STATS_VQ feature is=
 negotiated.)</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial=
,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ve=
rtical-align:baseline">The Linux virtio driver code originally seemed to us=
e the correct (by my reading) indexes, but it was changed to match the layo=
ut used by qemu in a 2019 commit (&quot;virtio_pci: use queue idx instead o=
f array idx to set up the vq&quot;) [3] - in other words, it will now also =
expect queue index 3 to be reporting_vq in the scenario laid out above.</sp=
an></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">I&#39;m not sure how to resolve the mismatch between the specificatio=
n and actual implementation behavior. The simplest change would probably be=
 to rewrite the specification to drop the explicit queue indexes in section=
 5.5.2 and add some wording about how queues are numbered based on negotiat=
ed feature bits (this would need to be applied to other device types that h=
ave specified queue indexes as well). However, this would also technically =
be an incompatible change of the specification. On the other hand, changing=
 the device and driver implementations to match the specification would be =
even more challenging, since it would be an incompatible change in actual p=
ractice, not just a change of the spec to match consensus implementation be=
havior.</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-ali=
gn:baseline"><br></span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial=
,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ve=
rtical-align:baseline">Perhaps drivers could add a quirk to detect old vers=
ions of the qemu device and use the old behavior, while enabling the correc=
t behavior only for other device vendors and newer qemu device revisions, a=
nd the qemu device could add an opt-in feature to enable the correct behavi=
or that users would need to enable only when they know they have a sufficie=
ntly new driver with the fix.</span></p><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-=
family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;vertical-align:baseline"><br></span></p><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline">Or maybe there could be a new =
feature bit that would opt into following the spec-defined queue indexes (V=
IRTIO_F_VERSION_2?) and some new wording to require devices to use the old =
behavior when that bit is not negotiated, but that also feels less than ide=
al to me.</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline">Any thoughts on how to proceed with this situation? Is m=
y reading of the specification just wrong?</span></p><br><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline">Thanks,</span></p><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;vertical-align:baseline">-- Daniel<=
/span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline">[1]: <a href=3D"https://docs.oasis-open.org/virtio/virtio/v1.2/csd=
01/virtio-v1.2-csd01.html#x1-3160002">https://docs.oasis-open.org/virtio/vi=
rtio/v1.2/csd01/virtio-v1.2-csd01.html#x1-3160002</a></span></p><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-variant-alternates:normal;vertical-align:baseline">[2]: <a href=3D"=
https://github.com/qemu/qemu/blob/f33c74576425fac2cbb0725229895fe096df4261/=
hw/virtio/virtio-balloon.c#L879-L897">https://github.com/qemu/qemu/blob/f33=
c74576425fac2cbb0725229895fe096df4261/hw/virtio/virtio-balloon.c#L879-L897<=
/a></span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline">[3]: <a href=3D"https://github.com/torvalds/linux/commit/ddbeac07a=
39a81d82331a312d0578fab94fccbf1">https://github.com/torvalds/linux/commit/d=
dbeac07a39a81d82331a312d0578fab94fccbf1</a></span></p><br></span></div>

--000000000000d4ab790603764491--
