Return-Path: <virtio-comment-return-7924-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8FAC004C0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 16:53:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 22F442B00A
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 16:53:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 192E598697B
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 16:53:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0F905986884; Mon, 23 Oct 2023 16:53:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 02172986888
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 16:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698080033; x=1698684833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9B6M92QjlOpjn2hrVHWQQUU/YlQbaRuTpR8ShduOQ3s=;
        b=tvHWJ132wN3nzNJvtSVLNwUd0DEeunQFsOAdu+/GW1Kt4/gNYOq7WTY2D1B7DADW9Q
         Mkq9MiUkAdGXgvJYqP8UtEhiNwa3i2sqgdoyGglMx0DB+NnYSq6FSCeAsnV8ZTx5O/0a
         OZQ4nS0q/1SC98ISLW95pak+qu3MHYeefyMlwPjjeVX9lhfk5/YaniSDKg6IiIL0fxTe
         zge004d4GrqpIMMD6jFBe/oHvR+4kWClwG6VK8F2cxU8LgXWRuvgEOm3DVV79m09HhI6
         OuDeGmurHgGqHVxAOuZFsvdqUEx5ecYWkPjP09HuJoPC2sF5UwHnHN2SGXyP8NG+y1Mw
         Fplw==
X-Gm-Message-State: AOJu0YxgIxM46YTOj32xmqDglxbMOFawYvbLM6ecfURwhiz2wTRM5f82
	0zPk6UQjVK9NxaTXnIpNo+vVry0PlK/nP+j9S3/xdg==
X-Google-Smtp-Source: AGHT+IFUGR0uW0/qeokVX+h/cvUDV3PrCrzRh6X6+gHaxXLyLcrE9nGaOJ7ngNdV8iUWc5kNE6mTLv3d2axgFDhZz+U=
X-Received: by 2002:a05:6830:453:b0:6b9:2869:bd81 with SMTP id
 d19-20020a056830045300b006b92869bd81mr10413039otc.18.1698080032744; Mon, 23
 Oct 2023 09:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <CA+c=0WfFVugbBN_fTeQb0RP6U+kQNO+uuC1L2wyb2rVAWeniaQ@mail.gmail.com>
 <878r7xd1e0.fsf@redhat.com> <20231020070230-mutt-send-email-mst@kernel.org>
 <CA+c=0WdA6-9NQs0jESN905nyU2k+mZThwnibavegQ616sY+QoQ@mail.gmail.com> <20231023071953-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231023071953-mutt-send-email-mst@kernel.org>
From: Jasper Haag <jasper@bedrocksystems.com>
Date: Mon, 23 Oct 2023 12:53:41 -0400
Message-ID: <CA+c=0Wc9bx32ytDQSj5HTMWgP4z1S07qrKB-Zyx6XGw08e8JgA@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, 
	Awais Masood <awais@bedrocksystems.com>, Gordon Stewart <gordon@bedrocksystems.com>
Content-Type: multipart/alternative; boundary="00000000000026fdef0608651168"
Subject: Re: [virtio-comment] [virtio-queue] CLARIFICATION: "free descriptors" External

--00000000000026fdef0608651168
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the concise response. It seems clear to us at BedRock Systems
that our VIRTIO Queue operational model will need to support aliasing of
both descriptor entries and payload memory.

For now we are focusing on making such updates to our operational model.
We will follow up with any other clarification questions which arise.

Your responsiveness has been much appreciated.

~Jasper



On Mon, Oct 23, 2023 at 7:21=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:

> On Fri, Oct 20, 2023 at 01:35:00PM -0400, Jasper Haag wrote:
> > Folks,
> >
> > Thank you kindly for the thoughtful responses! From the point of view
> > of formal modelling/verification I think there is a lot of benefit to b=
e
> had
> > from tightening the language in the VIRTIO specification. I also think
> > that the formal methods work we do at BedRock Systems puts us in a
> > position to contribute on this front - although I need to coordinate wi=
th
> > my managers regarding the logistics of such contributions, including
> sponsoring
> > membership(s) to the "OASIS Virtual I/O Device (VIRTIO) Technical
> Committee"
> > <https://www.oasis-open.org/committees/membership.php?wg_abbrev=3Dvirti=
o>.
> >
> > > Maybe we should add some text like "free entries in the
> > > descriptor table, henceforth referred to as 'free descriptors'".
> > This clarified text seems like an improvement, but it still leaves some
> > open questions in my mind - which Michael's response helps to tease
> > out.
> >
> > > Yes I think descriptors means free entries in the descriptor table.
> > > I don't think the MUST there is right - in theory
> > > I think the same descriptor chain can be used by multiple
> > > buffers, though I am not aware of any drivers that do this.
> > Overall, we're interested in understanding the ownership discipline
> > involved with the descriptor-entry/payload "resources" (in the sense of
> > linear logic). Our operational model will need to codify this disciplin=
e
> in
> > order to track/cede ownership of these "resources" at the appropriate
> > times, and aliasing will complicate the story here. To wit:
> > 1) If a Device owns two buffers which alias each other's descriptors, a=
nd
> >    sends one of the buffers back to the Driver, does the Device still o=
wn
> >    the other buffer it hasn't yet returned, including the buffer's
> descriptors?
> > 2) If a Device owns two buffers which alias payload memory, and sends o=
ne
> >    of the buffers back to the Driver, does the Device still own the
> payload
> >    memory referred to by the buffer it hasn't yet returned?
>
> I would say yes.
>
> > Along these lines, a few clarifications:
> > i)   Are Drivers allowed to alias descriptor chain suffixes, or only
> complete
> >      descriptor chains?
> > ii)  May a Driver /simultaneously expose/ multiple buffers which share
> > descriptor
> >      chain (suffixes)?
> > iii) May a Driver /simultaneously expose/ multiple buffers which
> (partially)
> > alias
> >      the same payload memory?
>
> Nothing seems to disallow this. iii actually happens sometimes.
>
> >
> > I look forward to continuing this discussion.
> >
> > ~Jasper
> >
> > On Fri, Oct 20, 2023 at 7:12=E2=80=AFAM Michael S. Tsirkin <mst@redhat.=
com>
> wrote:
> >
> >     On Fri, Oct 20, 2023 at 12:38:47PM +0200, Cornelia Huck wrote:
> >     > On Thu, Oct 12 2023, Jasper Haag <jasper@bedrocksystems.com>
> wrote:
> >     >
> >     > > To whom it may concern,
> >     > >
> >     > > BedRock Systems is working to formally model VIRTIO Queues and
> formally
> >     > > verify our implementation of VIRTIO Queues <
> >     > >
> https://github.com/bedrocksystems/vml/tree/main/devices/virtio_base>.
> >     One
> >     > > question which we've been unable to answer solely using the
> Standard
> >     text
> >     > > relates to "free descriptors" - as referred to within "2.7.13 -
> >     Supplying
> >     > > Buffers to The Device" <
> >     > > https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/
> >     virtio-v1.2-csd01.html#x1-6400013>.
> >     > > In particular, the text states:
> >     > >
> >     > > | 2.7.13 - Supplying Buffers to The Device
> >     > > | The driver offers buffers to one of the device=E2=80=99s virt=
queues as
> >     follows:
> >     > > |     1. The driver places the buffer into free descriptor(s) i=
n
> the
> >     > > descriptor table, chaining as necessary (see 2.7.5 The Virtqueu=
e
> >     Descriptor
> >     > > Table).
> >     > > |      .....
> >     > > |
> >     > > | 2.7.13.1 - Placing Buffers Into The Descriptor Table
> >     > > | A buffer consists of zero or more device-readable
> >     physically-contiguous
> >     > > elements followed by zero or more physically-contiguous
> device-writable
> >     > > elements (each has at least one element).
> >     > > | This algorithm maps it into the descriptor table to form a
> descriptor
> >     > > chain:
> >     > > | for each buffer element, b:
> >     > > |     1. Get the next free descriptor table entry, d
> >     > > |     2. Set d.addr to the physical address of the start of b
> >     > > |     3. Set d.len to the length of b.
> >     > > |     4. If b is device-writable, set d.flags to
> VIRTQ_DESC_F_WRITE,
> >     > > otherwise 0.
> >     > > |     5. If there is a buffer element after this:
> >     > > |         a. Set d.next to the index of the next free descripto=
r
> >     element.
> >     > > |         b. Set the VIRTQ_DESC_F_NEXT bit in d.flags.
> >     > > | In practice, d.next is usually used to chain free descriptors=
,
> and a
> >     > > separate count kept to check there are enough free descriptors
> before
> >     > > beginning the mappings.
> >     > >
> >     > > However, the term "free descriptor" doesn't appear to be define=
d
> >     anywhere
> >     > > within the Standard text. What characterizes such a "free
> descriptor",
> >     and
> >     > > does the use of the term "free descriptor" imply that the Drive=
r
> MUST
> >     NOT <
> >     > > https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/
> >     virtio-v1.2-csd01.html#x1-50003>
> >     > > use the same descriptor within multiple chains?
> >     > >
> >     > > I look forward to hearing your clarification.
> >     >
> >     > My guess is that this is mostly a case of a bit of sloppyness in =
a
> very
> >     > old part of the spec. A better term might be "free entries in the
> >     > descriptor table" (or even "unused entries..."), although that
> would be
> >     > a bit unwieldy. Maybe we should add some text like "free entries
> in the
> >     > descriptor table, henceforth referred to as 'free descriptors'".
> >     >
> >     > Michael, what do you think?
> >
> >     Yes I think descriptors means free entries in the descriptor table.
> >     I don't think the MUST there is right - in theory
> >     I think the same descriptor chain can be used by multiple
> >     buffers, though I am not aware of any drivers that do this.
> >     So I feel "free" here merely means "not used for some other
> >     purpose". E.g. entries not referenced by any chains can be used
> >     by driver to keep some data for its internal purposes
> >     (and sometimes is) - if an entry is used like this and the driver
> >     needs the data there then I guess it should not be used for
> >     descriptors.
> >
> >     We do say:
> >             A driver MUST NOT alter virtqueue entries for exposed
> buffers,
> >             i.e., buffers which have been
> >             made available to the device (and not been used by the
> device)
> >             of a live virtqueue.
> >     So such chains must not be modified while available to device.
> >
> >
> >
> >
> >
> >
> >     I also think we still need a lot of cleanup in the
> buffer/descriptor/entry
> >     area. And I feel we should just bite the bullet and talk about
> entries
> >     here though - descriptors are widely used to mean valid/available
> >     entries.
> >
> >
> >     --
> >     MST
> >
> >
> >     This publicly archived list offers a means to provide input to the
> >     OASIS Virtual I/O Device (VIRTIO) TC.
> >
> >     In order to verify user consent to the Feedback License terms and
> >     to minimize spam in the list archive, subscription is required
> >     before posting.
> >
> >     Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >     Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >     List help: virtio-comment-help@lists.oasis-open.org
> >     List archive: https://lists.oasis-open.org/archives/virtio-comment/
> >     Feedback License:
> https://www.oasis-open.org/who/ipr/feedback_license.pdf
> >     List Guidelines: https://www.oasis-open.org/policies-guidelines/
> >     mailing-lists
> >     Committee: https://www.oasis-open.org/committees/virtio/
> >     Join OASIS: https://www.oasis-open.org/join/
> >
> >
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines:
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>
>

--00000000000026fdef0608651168
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the concise response. It seems clear to us at B=
edRock Systems<br><div>that our VIRTIO Queue operational model will need to=
 support aliasing of</div><div>both descriptor entries and payload memory.<=
/div><div><br></div><div>For now we are focusing on making such updates to =
our operational model. </div><div>We will follow up with any other clarific=
ation questions which arise.</div><div><br></div><div>Your responsiveness h=
as been much appreciated.</div><div><br></div><div>~Jasper<br></div><div><b=
r></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, Oct 23, 2023 at 7:21=E2=80=AFAM Michael S. T=
sirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Oct 20, =
2023 at 01:35:00PM -0400, Jasper Haag wrote:<br>
&gt; Folks,<br>
&gt; <br>
&gt; Thank you kindly for the thoughtful responses! From the point of view<=
br>
&gt; of formal modelling/verification I think there is a lot of benefit to =
be had<br>
&gt; from tightening the language in the VIRTIO specification. I also think=
<br>
&gt; that the formal methods work we do at BedRock Systems puts us in a<br>
&gt; position to contribute on this front - although I need to coordinate w=
ith<br>
&gt; my managers regarding the logistics of such contributions, including s=
ponsoring<br>
&gt; membership(s) to the &quot;OASIS Virtual I/O Device (VIRTIO) Technical=
 Committee&quot;<br>
&gt; &lt;<a href=3D"https://www.oasis-open.org/committees/membership.php?wg=
_abbrev=3Dvirtio" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-op=
en.org/committees/membership.php?wg_abbrev=3Dvirtio</a>&gt;.<br>
&gt; <br>
&gt; &gt; Maybe we should add some text like &quot;free entries in the<br>
&gt; &gt; descriptor table, henceforth referred to as &#39;free descriptors=
&#39;&quot;.<br>
&gt; This clarified text seems like an improvement, but it still leaves som=
e<br>
&gt; open questions in my mind - which Michael&#39;s response helps to teas=
e<br>
&gt; out.<br>
&gt; <br>
&gt; &gt; Yes I think descriptors means free entries in the descriptor tabl=
e.<br>
&gt; &gt; I don&#39;t think the MUST there is right - in theory<br>
&gt; &gt; I think the same descriptor chain can be used by multiple<br>
&gt; &gt; buffers, though I am not aware of any drivers that do this.<br>
&gt; Overall, we&#39;re interested in understanding the ownership disciplin=
e<br>
&gt; involved with the descriptor-entry/payload &quot;resources&quot; (in t=
he sense of<br>
&gt; linear logic). Our operational model will need to codify this discipli=
ne in<br>
&gt; order to track/cede ownership of these &quot;resources&quot; at the ap=
propriate<br>
&gt; times, and aliasing will complicate the story here. To wit:<br>
&gt; 1) If a Device owns two buffers which alias each other&#39;s descripto=
rs, and<br>
&gt; =C2=A0 =C2=A0sends one of the buffers back to the Driver, does the Dev=
ice still own<br>
&gt; =C2=A0 =C2=A0the other buffer it hasn&#39;t yet returned, including th=
e buffer&#39;s descriptors?<br>
&gt; 2) If a Device owns two buffers which alias payload memory, and sends =
one<br>
&gt; =C2=A0 =C2=A0of the buffers back to the Driver, does the Device still =
own the payload<br>
&gt; =C2=A0 =C2=A0memory referred to by the buffer it hasn&#39;t yet return=
ed?<br>
<br>
I would say yes.<br>
<br>
&gt; Along these lines, a few clarifications:<br>
&gt; i) =C2=A0 Are Drivers allowed to alias descriptor chain suffixes, or o=
nly complete<br>
&gt; =C2=A0 =C2=A0 =C2=A0descriptor chains?<br>
&gt; ii) =C2=A0May a Driver /simultaneously expose/ multiple buffers which =
share<br>
&gt; descriptor<br>
&gt; =C2=A0 =C2=A0 =C2=A0chain (suffixes)?<br>
&gt; iii) May a Driver /simultaneously expose/ multiple buffers which (part=
ially)<br>
&gt; alias<br>
&gt; =C2=A0 =C2=A0 =C2=A0the same payload memory?<br>
<br>
Nothing seems to disallow this. iii actually happens sometimes.<br>
<br>
&gt; <br>
&gt; I look forward to continuing this discussion.<br>
&gt; <br>
&gt; ~Jasper<br>
&gt; <br>
&gt; On Fri, Oct 20, 2023 at 7:12=E2=80=AFAM Michael S. Tsirkin &lt;<a href=
=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Fri, Oct 20, 2023 at 12:38:47PM +0200, Cornelia =
Huck wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, Oct 12 2023, Jasper Haag &lt;<a href=
=3D"mailto:jasper@bedrocksystems.com" target=3D"_blank">jasper@bedrocksyste=
ms.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; To whom it may concern,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; BedRock Systems is working to formally mo=
del VIRTIO Queues and formally<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; verify our implementation of VIRTIO Queue=
s &lt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; <a href=3D"https://github.com/bedrocksyst=
ems/vml/tree/main/devices/virtio_base" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/bedrocksystems/vml/tree/main/devices/virtio_base</a>&gt=
;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0One<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; question which we&#39;ve been unable to a=
nswer solely using the Standard<br>
&gt;=C2=A0 =C2=A0 =C2=A0text<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; relates to &quot;free descriptors&quot; -=
 as referred to within &quot;2.7.13 -<br>
&gt;=C2=A0 =C2=A0 =C2=A0Supplying<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Buffers to The Device&quot; &lt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; <a href=3D"https://docs.oasis-open.org/vi=
rtio/virtio/v1.2/csd01/" rel=3D"noreferrer" target=3D"_blank">https://docs.=
oasis-open.org/virtio/virtio/v1.2/csd01/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0virtio-v1.2-csd01.html#x1-6400013&gt;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; In particular, the text states:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; | 2.7.13 - Supplying Buffers to The Devic=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; | The driver offers buffers to one of the=
 device=E2=80=99s virtqueues as<br>
&gt;=C2=A0 =C2=A0 =C2=A0follows:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; |=C2=A0 =C2=A0 =C2=A01. The driver places=
 the buffer into free descriptor(s) in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; descriptor table, chaining as necessary (=
see 2.7.5 The Virtqueue<br>
&gt;=C2=A0 =C2=A0 =C2=A0Descriptor<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Table).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 .....<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; |<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; | 2.7.13.1 - Placing Buffers Into The Des=
criptor Table<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; | A buffer consists of zero or more devic=
e-readable<br>
&gt;=C2=A0 =C2=A0 =C2=A0physically-contiguous<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; elements followed by zero or more physica=
lly-contiguous device-writable<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; elements (each has at least one element).=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; | This algorithm maps it into the descrip=
tor table to form a descriptor<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; chain:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; | for each buffer element, b:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; |=C2=A0 =C2=A0 =C2=A01. Get the next free=
 descriptor table entry, d<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; |=C2=A0 =C2=A0 =C2=A02. Set d.addr to the=
 physical address of the start of b<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; |=C2=A0 =C2=A0 =C2=A03. Set d.len to the =
length of b.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; |=C2=A0 =C2=A0 =C2=A04. If b is device-wr=
itable, set d.flags to VIRTQ_DESC_F_WRITE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; otherwise 0.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; |=C2=A0 =C2=A0 =C2=A05. If there is a buf=
fer element after this:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a. Set=
 d.next to the index of the next free descriptor<br>
&gt;=C2=A0 =C2=A0 =C2=A0element.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b. Set=
 the VIRTQ_DESC_F_NEXT bit in d.flags.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; | In practice, d.next is usually used to =
chain free descriptors, and a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; separate count kept to check there are en=
ough free descriptors before<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; beginning the mappings.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; However, the term &quot;free descriptor&q=
uot; doesn&#39;t appear to be defined<br>
&gt;=C2=A0 =C2=A0 =C2=A0anywhere<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; within the Standard text. What characteri=
zes such a &quot;free descriptor&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; does the use of the term &quot;free descr=
iptor&quot; imply that the Driver MUST<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOT &lt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; <a href=3D"https://docs.oasis-open.org/vi=
rtio/virtio/v1.2/csd01/" rel=3D"noreferrer" target=3D"_blank">https://docs.=
oasis-open.org/virtio/virtio/v1.2/csd01/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0virtio-v1.2-csd01.html#x1-50003&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; use the same descriptor within multiple c=
hains?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; I look forward to hearing your clarificat=
ion.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; My guess is that this is mostly a case of a bi=
t of sloppyness in a very<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; old part of the spec. A better term might be &=
quot;free entries in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; descriptor table&quot; (or even &quot;unused e=
ntries...&quot;), although that would be<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; a bit unwieldy. Maybe we should add some text =
like &quot;free entries in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; descriptor table, henceforth referred to as &#=
39;free descriptors&#39;&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Michael, what do you think?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Yes I think descriptors means free entries in the d=
escriptor table.<br>
&gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t think the MUST there is right - in theo=
ry<br>
&gt;=C2=A0 =C2=A0 =C2=A0I think the same descriptor chain can be used by mu=
ltiple<br>
&gt;=C2=A0 =C2=A0 =C2=A0buffers, though I am not aware of any drivers that =
do this.<br>
&gt;=C2=A0 =C2=A0 =C2=A0So I feel &quot;free&quot; here merely means &quot;=
not used for some other<br>
&gt;=C2=A0 =C2=A0 =C2=A0purpose&quot;. E.g. entries not referenced by any c=
hains can be used<br>
&gt;=C2=A0 =C2=A0 =C2=A0by driver to keep some data for its internal purpos=
es<br>
&gt;=C2=A0 =C2=A0 =C2=A0(and sometimes is) - if an entry is used like this =
and the driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0needs the data there then I guess it should not be =
used for<br>
&gt;=C2=A0 =C2=A0 =C2=A0descriptors.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0We do say:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 A driver MUST NOT alter=
 virtqueue entries for exposed buffers,<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 i.e., buffers which hav=
e been<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 made available to the d=
evice (and not been used by the device)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 of a live virtqueue.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0So such chains must not be modified while available=
 to device.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I also think we still need a lot of cleanup in the =
buffer/descriptor/entry<br>
&gt;=C2=A0 =C2=A0 =C2=A0area. And I feel we should just bite the bullet and=
 talk about entries<br>
&gt;=C2=A0 =C2=A0 =C2=A0here though - descriptors are widely used to mean v=
alid/available<br>
&gt;=C2=A0 =C2=A0 =C2=A0entries.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0MST<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This publicly archived list offers a means to provi=
de input to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0OASIS Virtual I/O Device (VIRTIO) TC.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In order to verify user consent to the Feedback Lic=
ense terms and<br>
&gt;=C2=A0 =C2=A0 =C2=A0to minimize spam in the list archive, subscription =
is required<br>
&gt;=C2=A0 =C2=A0 =C2=A0before posting.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Subscribe: <a href=3D"mailto:virtio-comment-subscri=
be@lists.oasis-open.org" target=3D"_blank">virtio-comment-subscribe@lists.o=
asis-open.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe: <a href=3D"mailto:virtio-comment-unsub=
scribe@lists.oasis-open.org" target=3D"_blank">virtio-comment-unsubscribe@l=
ists.oasis-open.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0List help: <a href=3D"mailto:virtio-comment-help@li=
sts.oasis-open.org" target=3D"_blank">virtio-comment-help@lists.oasis-open.=
org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0List archive: <a href=3D"https://lists.oasis-open.o=
rg/archives/virtio-comment/" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.oasis-open.org/archives/virtio-comment/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Feedback License: <a href=3D"https://www.oasis-open=
.org/who/ipr/feedback_license.pdf" rel=3D"noreferrer" target=3D"_blank">htt=
ps://www.oasis-open.org/who/ipr/feedback_license.pdf</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0List Guidelines: <a href=3D"https://www.oasis-open.=
org/policies-guidelines/" rel=3D"noreferrer" target=3D"_blank">https://www.=
oasis-open.org/policies-guidelines/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0mailing-lists<br>
&gt;=C2=A0 =C2=A0 =C2=A0Committee: <a href=3D"https://www.oasis-open.org/co=
mmittees/virtio/" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-op=
en.org/committees/virtio/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Join OASIS: <a href=3D"https://www.oasis-open.org/j=
oin/" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/join/=
</a><br>
&gt; <br>
&gt; <br>
<br>
<br>
This publicly archived list offers a means to provide input to the<br>
OASIS Virtual I/O Device (VIRTIO) TC.<br>
<br>
In order to verify user consent to the Feedback License terms and<br>
to minimize spam in the list archive, subscription is required<br>
before posting.<br>
<br>
Subscribe: <a href=3D"mailto:virtio-comment-subscribe@lists.oasis-open.org"=
 target=3D"_blank">virtio-comment-subscribe@lists.oasis-open.org</a><br>
Unsubscribe: <a href=3D"mailto:virtio-comment-unsubscribe@lists.oasis-open.=
org" target=3D"_blank">virtio-comment-unsubscribe@lists.oasis-open.org</a><=
br>
List help: <a href=3D"mailto:virtio-comment-help@lists.oasis-open.org" targ=
et=3D"_blank">virtio-comment-help@lists.oasis-open.org</a><br>
List archive: <a href=3D"https://lists.oasis-open.org/archives/virtio-comme=
nt/" rel=3D"noreferrer" target=3D"_blank">https://lists.oasis-open.org/arch=
ives/virtio-comment/</a><br>
Feedback License: <a href=3D"https://www.oasis-open.org/who/ipr/feedback_li=
cense.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/=
who/ipr/feedback_license.pdf</a><br>
List Guidelines: <a href=3D"https://www.oasis-open.org/policies-guidelines/=
mailing-lists" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.=
org/policies-guidelines/mailing-lists</a><br>
Committee: <a href=3D"https://www.oasis-open.org/committees/virtio/" rel=3D=
"noreferrer" target=3D"_blank">https://www.oasis-open.org/committees/virtio=
/</a><br>
Join OASIS: <a href=3D"https://www.oasis-open.org/join/" rel=3D"noreferrer"=
 target=3D"_blank">https://www.oasis-open.org/join/</a><br>
<br>
</blockquote></div>

--00000000000026fdef0608651168--
