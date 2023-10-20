Return-Path: <virtio-comment-return-7887-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F7CCDB474
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 17:35:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F23912AC4F
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 17:35:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B8514986944
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 17:35:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 99B3698693A; Fri, 20 Oct 2023 17:35:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5CDB498693B
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Oct 2023 17:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697823311; x=1698428111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGFLFufCIIV4sfzctc+VTqmOCktth4hJW0Vxy7RPecM=;
        b=RkTIqiA8zxJ3YnlwisF1+1Gv/lhL5smFGqvQ7iiKm8pjUwh/lu1Ims4NHfU5+8HTkV
         /GIcqNQF7QEALPQSaDuO0G1SyjQuqMuGDqpB5F9Quzj0cvBi9JxAs88IEsASmR+ekC3+
         BqwP53fMdAqHScppwv22DCQaqPqKiey0oEvx4NYX79zzPVk+/A64nNRJsMvlf4zmjq70
         p6ETQW/FL8a4dDIXCW6NI5+U//MB7X/RF7K5gDrj0V8bfPGDeInmO0Jm3gxErdFuB/sp
         av/BkPAg225Pv/Y1p8IFmUBAhAQQhFQ5/y8Jg/iaUAy4G8GouU4ina8EWf50RFt3jkOE
         97Ug==
X-Gm-Message-State: AOJu0YyIaoMbmXQlbxlcfSRR21VNixH1Q/8uaVAUEjXqizyTIl/Wsi73
	Gz+m2fYIKFQk32VyX3nr+hyoKf2iP2DWfMw8pWtvuA==
X-Google-Smtp-Source: AGHT+IFqG50z0PUEIGoj3+Lmx19q0COvsiGdvKqbFe17z475mLIwzjzPghN57IcRqqkjT+rSEpmDsgtaQrs0/ykKPFs=
X-Received: by 2002:a05:6808:210f:b0:3a7:26fd:b229 with SMTP id
 r15-20020a056808210f00b003a726fdb229mr2917752oiw.48.1697823311190; Fri, 20
 Oct 2023 10:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <CA+c=0WfFVugbBN_fTeQb0RP6U+kQNO+uuC1L2wyb2rVAWeniaQ@mail.gmail.com>
 <878r7xd1e0.fsf@redhat.com> <20231020070230-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231020070230-mutt-send-email-mst@kernel.org>
From: Jasper Haag <jasper@bedrocksystems.com>
Date: Fri, 20 Oct 2023 13:35:00 -0400
Message-ID: <CA+c=0WdA6-9NQs0jESN905nyU2k+mZThwnibavegQ616sY+QoQ@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, 
	Awais Masood <awais@bedrocksystems.com>, Gordon Stewart <gordon@bedrocksystems.com>
Content-Type: multipart/alternative; boundary="0000000000005af6520608294be9"
Subject: Re: [virtio-comment] [virtio-queue] CLARIFICATION: "free descriptors" External

--0000000000005af6520608294be9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Folks,

Thank you kindly for the thoughtful responses! From the point of view
of formal modelling/verification I think there is a lot of benefit to be ha=
d
from tightening the language in the VIRTIO specification. I also think
that the formal methods work we do at BedRock Systems puts us in a
position to contribute on this front - although I need to coordinate with
my managers regarding the logistics of such contributions, including
sponsoring
membership(s) to the "OASIS Virtual I/O Device (VIRTIO) Technical Committee=
"
<https://www.oasis-open.org/committees/membership.php?wg_abbrev=3Dvirtio>.

> Maybe we should add some text like "free entries in the
> descriptor table, henceforth referred to as 'free descriptors'".
This clarified text seems like an improvement, but it still leaves some
open questions in my mind - which Michael's response helps to tease
out.

> Yes I think descriptors means free entries in the descriptor table.
> I don't think the MUST there is right - in theory
> I think the same descriptor chain can be used by multiple
> buffers, though I am not aware of any drivers that do this.
Overall, we're interested in understanding the ownership discipline
involved with the descriptor-entry/payload "resources" (in the sense of
linear logic). Our operational model will need to codify this discipline in
order to track/cede ownership of these "resources" at the appropriate
times, and aliasing will complicate the story here. To wit:
1) If a Device owns two buffers which alias each other's descriptors, and
   sends one of the buffers back to the Driver, does the Device still own
   the other buffer it hasn't yet returned, including the buffer's
descriptors?
2) If a Device owns two buffers which alias payload memory, and sends one
   of the buffers back to the Driver, does the Device still own the payload
   memory referred to by the buffer it hasn't yet returned?

Along these lines, a few clarifications:
i)   Are Drivers allowed to alias descriptor chain suffixes, or only
complete
     descriptor chains?
ii)  May a Driver /simultaneously expose/ multiple buffers which share
descriptor
     chain (suffixes)?
iii) May a Driver /simultaneously expose/ multiple buffers which
(partially) alias
     the same payload memory?

I look forward to continuing this discussion.

~Jasper

On Fri, Oct 20, 2023 at 7:12=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:

> On Fri, Oct 20, 2023 at 12:38:47PM +0200, Cornelia Huck wrote:
> > On Thu, Oct 12 2023, Jasper Haag <jasper@bedrocksystems.com> wrote:
> >
> > > To whom it may concern,
> > >
> > > BedRock Systems is working to formally model VIRTIO Queues and formal=
ly
> > > verify our implementation of VIRTIO Queues <
> > > https://github.com/bedrocksystems/vml/tree/main/devices/virtio_base>.
> One
> > > question which we've been unable to answer solely using the Standard
> text
> > > relates to "free descriptors" - as referred to within "2.7.13 -
> Supplying
> > > Buffers to The Device" <
> > >
> https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.ht=
ml#x1-6400013
> >.
> > > In particular, the text states:
> > >
> > > | 2.7.13 - Supplying Buffers to The Device
> > > | The driver offers buffers to one of the device=E2=80=99s virtqueues=
 as
> follows:
> > > |     1. The driver places the buffer into free descriptor(s) in the
> > > descriptor table, chaining as necessary (see 2.7.5 The Virtqueue
> Descriptor
> > > Table).
> > > |      .....
> > > |
> > > | 2.7.13.1 - Placing Buffers Into The Descriptor Table
> > > | A buffer consists of zero or more device-readable
> physically-contiguous
> > > elements followed by zero or more physically-contiguous device-writab=
le
> > > elements (each has at least one element).
> > > | This algorithm maps it into the descriptor table to form a descript=
or
> > > chain:
> > > | for each buffer element, b:
> > > |     1. Get the next free descriptor table entry, d
> > > |     2. Set d.addr to the physical address of the start of b
> > > |     3. Set d.len to the length of b.
> > > |     4. If b is device-writable, set d.flags to VIRTQ_DESC_F_WRITE,
> > > otherwise 0.
> > > |     5. If there is a buffer element after this:
> > > |         a. Set d.next to the index of the next free descriptor
> element.
> > > |         b. Set the VIRTQ_DESC_F_NEXT bit in d.flags.
> > > | In practice, d.next is usually used to chain free descriptors, and =
a
> > > separate count kept to check there are enough free descriptors before
> > > beginning the mappings.
> > >
> > > However, the term "free descriptor" doesn't appear to be defined
> anywhere
> > > within the Standard text. What characterizes such a "free descriptor"=
,
> and
> > > does the use of the term "free descriptor" imply that the Driver MUST
> NOT <
> > >
> https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.ht=
ml#x1-50003
> >
> > > use the same descriptor within multiple chains?
> > >
> > > I look forward to hearing your clarification.
> >
> > My guess is that this is mostly a case of a bit of sloppyness in a very
> > old part of the spec. A better term might be "free entries in the
> > descriptor table" (or even "unused entries..."), although that would be
> > a bit unwieldy. Maybe we should add some text like "free entries in the
> > descriptor table, henceforth referred to as 'free descriptors'".
> >
> > Michael, what do you think?
>
> Yes I think descriptors means free entries in the descriptor table.
> I don't think the MUST there is right - in theory
> I think the same descriptor chain can be used by multiple
> buffers, though I am not aware of any drivers that do this.
> So I feel "free" here merely means "not used for some other
> purpose". E.g. entries not referenced by any chains can be used
> by driver to keep some data for its internal purposes
> (and sometimes is) - if an entry is used like this and the driver
> needs the data there then I guess it should not be used for
> descriptors.
>
> We do say:
>         A driver MUST NOT alter virtqueue entries for exposed buffers,
>         i.e., buffers which have been
>         made available to the device (and not been used by the device)
>         of a live virtqueue.
> So such chains must not be modified while available to device.
>
>
>
>
>
>
> I also think we still need a lot of cleanup in the buffer/descriptor/entr=
y
> area. And I feel we should just bite the bullet and talk about entries
> here though - descriptors are widely used to mean valid/available
> entries.
>
>
> --
> MST
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

--0000000000005af6520608294be9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Folks,<br><br>Thank you kindly for the thoughtful response=
s! From the point of view<br>of formal modelling/verification I think there=
 is a lot of benefit to be had<br>from tightening the language in the VIRTI=
O specification. I also think<br>that the formal methods work we do at BedR=
ock Systems puts us in a<br>position to contribute on this front - although=
 I need to coordinate with<br>my managers regarding the logistics of such c=
ontributions, including sponsoring<br>membership(s) to the &quot;OASIS Virt=
ual I/O Device (VIRTIO) Technical Committee&quot;<br>&lt;<a href=3D"https:/=
/www.oasis-open.org/committees/membership.php?wg_abbrev=3Dvirtio">https://w=
ww.oasis-open.org/committees/membership.php?wg_abbrev=3Dvirtio</a>&gt;.<br>=
<br>&gt; Maybe we should add some text like &quot;free entries in the<br>&g=
t; descriptor table, henceforth referred to as &#39;free descriptors&#39;&q=
uot;.<br>This clarified text seems like an improvement, but it still leaves=
 some<br>open questions in my mind - which Michael&#39;s response helps to =
tease<br>out.<br><br>&gt; Yes I think descriptors means free entries in the=
 descriptor table.<br>&gt; I don&#39;t think the MUST there is right - in t=
heory<br>&gt; I think the same descriptor chain can be used by multiple<br>=
&gt; buffers, though I am not aware of any drivers that do this.<br>Overall=
, we&#39;re interested in understanding the ownership discipline<br>involve=
d with the descriptor-entry/payload &quot;resources&quot; (in the sense of<=
br>linear logic). Our operational model will need to codify this discipline=
 in<br>order to track/cede ownership of these &quot;resources&quot; at the =
appropriate<br>times, and aliasing will complicate the story here. To wit:<=
br>1) If a Device owns two buffers which alias each other&#39;s descriptors=
, and<br>=C2=A0 =C2=A0sends one of the buffers back to the Driver, does the=
 Device still own<br>=C2=A0 =C2=A0the other buffer it hasn&#39;t yet return=
ed, including the buffer&#39;s descriptors?<br>2) If a Device owns two buff=
ers which alias payload memory, and sends one<br>=C2=A0 =C2=A0of the buffer=
s back to the Driver, does the Device still own the payload<br>=C2=A0 =C2=
=A0memory referred to by the buffer it hasn&#39;t yet returned?<br><br>Alon=
g these lines, a few clarifications:<br>i) =C2=A0 Are Drivers allowed to al=
ias descriptor chain suffixes, or only complete<br>=C2=A0 =C2=A0 =C2=A0desc=
riptor chains?<br>ii) =C2=A0May a Driver /simultaneously expose/ multiple b=
uffers which share descriptor<br>=C2=A0 =C2=A0 =C2=A0chain (suffixes)?<br>i=
ii) May a Driver /simultaneously expose/ multiple buffers which (partially)=
 alias<br>=C2=A0 =C2=A0 =C2=A0the same payload memory?<br><br>I look forwar=
d to continuing this discussion.<br><br>~Jasper</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 20, 2023 at 7:12=
=E2=80=AFAM Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Fri, Oct 20, 2023 at 12:38:47PM +0200, Cornelia Huck wrote:<br>
&gt; On Thu, Oct 12 2023, Jasper Haag &lt;<a href=3D"mailto:jasper@bedrocks=
ystems.com" target=3D"_blank">jasper@bedrocksystems.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; To whom it may concern,<br>
&gt; &gt;<br>
&gt; &gt; BedRock Systems is working to formally model VIRTIO Queues and fo=
rmally<br>
&gt; &gt; verify our implementation of VIRTIO Queues &lt;<br>
&gt; &gt; <a href=3D"https://github.com/bedrocksystems/vml/tree/main/device=
s/virtio_base" rel=3D"noreferrer" target=3D"_blank">https://github.com/bedr=
ocksystems/vml/tree/main/devices/virtio_base</a>&gt;. One<br>
&gt; &gt; question which we&#39;ve been unable to answer solely using the S=
tandard text<br>
&gt; &gt; relates to &quot;free descriptors&quot; - as referred to within &=
quot;2.7.13 - Supplying<br>
&gt; &gt; Buffers to The Device&quot; &lt;<br>
&gt; &gt; <a href=3D"https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/v=
irtio-v1.2-csd01.html#x1-6400013" rel=3D"noreferrer" target=3D"_blank">http=
s://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html#x1-=
6400013</a>&gt;.<br>
&gt; &gt; In particular, the text states:<br>
&gt; &gt;<br>
&gt; &gt; | 2.7.13 - Supplying Buffers to The Device<br>
&gt; &gt; | The driver offers buffers to one of the device=E2=80=99s virtqu=
eues as follows:<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A01. The driver places the buffer into free de=
scriptor(s) in the<br>
&gt; &gt; descriptor table, chaining as necessary (see 2.7.5 The Virtqueue =
Descriptor<br>
&gt; &gt; Table).<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 .....<br>
&gt; &gt; |<br>
&gt; &gt; | 2.7.13.1 - Placing Buffers Into The Descriptor Table<br>
&gt; &gt; | A buffer consists of zero or more device-readable physically-co=
ntiguous<br>
&gt; &gt; elements followed by zero or more physically-contiguous device-wr=
itable<br>
&gt; &gt; elements (each has at least one element).<br>
&gt; &gt; | This algorithm maps it into the descriptor table to form a desc=
riptor<br>
&gt; &gt; chain:<br>
&gt; &gt; | for each buffer element, b:<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A01. Get the next free descriptor table entry,=
 d<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A02. Set d.addr to the physical address of the=
 start of b<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A03. Set d.len to the length of b.<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A04. If b is device-writable, set d.flags to V=
IRTQ_DESC_F_WRITE,<br>
&gt; &gt; otherwise 0.<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A05. If there is a buffer element after this:<=
br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a. Set d.next to the index of =
the next free descriptor element.<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b. Set the VIRTQ_DESC_F_NEXT b=
it in d.flags.<br>
&gt; &gt; | In practice, d.next is usually used to chain free descriptors, =
and a<br>
&gt; &gt; separate count kept to check there are enough free descriptors be=
fore<br>
&gt; &gt; beginning the mappings.<br>
&gt; &gt;<br>
&gt; &gt; However, the term &quot;free descriptor&quot; doesn&#39;t appear =
to be defined anywhere<br>
&gt; &gt; within the Standard text. What characterizes such a &quot;free de=
scriptor&quot;, and<br>
&gt; &gt; does the use of the term &quot;free descriptor&quot; imply that t=
he Driver MUST NOT &lt;<br>
&gt; &gt; <a href=3D"https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/v=
irtio-v1.2-csd01.html#x1-50003" rel=3D"noreferrer" target=3D"_blank">https:=
//docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html#x1-50=
003</a>&gt;<br>
&gt; &gt; use the same descriptor within multiple chains?<br>
&gt; &gt;<br>
&gt; &gt; I look forward to hearing your clarification.<br>
&gt; <br>
&gt; My guess is that this is mostly a case of a bit of sloppyness in a ver=
y<br>
&gt; old part of the spec. A better term might be &quot;free entries in the=
<br>
&gt; descriptor table&quot; (or even &quot;unused entries...&quot;), althou=
gh that would be<br>
&gt; a bit unwieldy. Maybe we should add some text like &quot;free entries =
in the<br>
&gt; descriptor table, henceforth referred to as &#39;free descriptors&#39;=
&quot;.<br>
&gt; <br>
&gt; Michael, what do you think?<br>
<br>
Yes I think descriptors means free entries in the descriptor table.<br>
I don&#39;t think the MUST there is right - in theory<br>
I think the same descriptor chain can be used by multiple<br>
buffers, though I am not aware of any drivers that do this.<br>
So I feel &quot;free&quot; here merely means &quot;not used for some other<=
br>
purpose&quot;. E.g. entries not referenced by any chains can be used<br>
by driver to keep some data for its internal purposes<br>
(and sometimes is) - if an entry is used like this and the driver<br>
needs the data there then I guess it should not be used for<br>
descriptors.<br>
<br>
We do say:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 A driver MUST NOT alter virtqueue entries for e=
xposed buffers,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 i.e., buffers which have been<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 made available to the device (and not been used=
 by the device)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of a live virtqueue.<br>
So such chains must not be modified while available to device.<br>
<br>
<br>
<br>
<br>
<br>
<br>
I also think we still need a lot of cleanup in the buffer/descriptor/entry<=
br>
area. And I feel we should just bite the bullet and talk about entries<br>
here though - descriptors are widely used to mean valid/available<br>
entries.<br>
<br>
<br>
-- <br>
MST<br>
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

--0000000000005af6520608294be9--
