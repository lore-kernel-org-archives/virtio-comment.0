Return-Path: <virtio-comment-return-5971-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A6BC77B7D
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 19:09:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E4EB21318C2
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 19:09:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DD642986722
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 19:09:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D7736986719; Thu, 18 May 2023 19:09:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C128C98671A
	for <virtio-comment@lists.oasis-open.org>; Thu, 18 May 2023 19:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684436989; x=1687028989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgjTpmeRULLhvKA1P3awSz/QppcnqRDsNN8Q1D9Ehv0=;
        b=iZ/r/qWlDQ/tj1EP0HuRSHCLvPIzEhWi2g9Xpdhd9y0qOyRMNUO/5nMNlCcHvsZ2eS
         CJN2+FakvadwrrWp57lfbov6jOsjDzCa2mcQG9qFYuE9pU+x4SX/EWAdgI2DnaeELA9x
         6TazMiNvjrcf3Dle9t+nc7xDv+uY1onAbLz10NkcHVIOsFYHDhE3nFcJ4nos0LnUSJUG
         uqQIv++/b1OlNYKQkbwHoYrLX+8crDeI3ERQKD1NGufK/I+NF8jRK+Q6BlmpmtAqIK7c
         hf1+csEq5tqCiz9gY7eGhlmiuBUgypRfDTsV0+9q0J08ecT9vXYoIDcNZXySOcx/D/ya
         PPXg==
X-Gm-Message-State: AC+VfDw7Az8ZIZrE7kxtXvLDScQoTQTYe4bZ46+64FVsZWtXN8Tr1UQB
	wBGsz8NPUyNxFGDNqisoLHgPA8vj6rwYz03h2B1w81I=
X-Google-Smtp-Source: ACHHUZ4D4rjGccZ25c522JWg6W6cNCRWMddpiFyzJJ3EFiLVNS9RYehqZc6yfsYQAYWfcweeroHEVqxfO7EQjP3evEw=
X-Received: by 2002:a92:c88f:0:b0:331:9a82:33f6 with SMTP id
 w15-20020a92c88f000000b003319a8233f6mr3995846ilo.5.1684436989009; Thu, 18 May
 2023 12:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CANerMUV1vCA9j6QJ+0q93VoUeUkesuv_mToK6o3iz0989OC+Fg@mail.gmail.com>
 <CAJaqyWf1bKrSZOLY3R2KxZxgLnJ1BH=PXzqvatBHmKQs3zgL9A@mail.gmail.com>
 <CAAwgnnMgyWqm9wAU0y7DXt7TAO=TtfPuBW4omFajw=eSeYOc-g@mail.gmail.com> <20230518143013-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230518143013-mutt-send-email-mst@kernel.org>
From: Chet Ensign <chet.ensign@oasis-open.org>
Date: Thu, 18 May 2023 15:09:38 -0400
Message-ID: <CAAwgnnOfyKsjb-h4OuZXhM0XVH1xvn5cfZMUXG=xwJZ7qBjEig@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>, Ariel Adam <aadam@redhat.com>, 
	Parav Pandit <parav@nvidia.com>, 
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Content-Type: multipart/alternative; boundary="000000000000607a1b05fbfc8cb9"
Subject: [virtio-comment] Re: [virtio] Re: [virtio-comment] virtio networking collaboration
 meeting: call for agenda

--000000000000607a1b05fbfc8cb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Michael. I knew the TC operates that way so I found the exchange
confusing.

The key issue here is IPR commitments that go with contributions. When
someone makes a contribution to the TC - chunk of code or whatever - their
IPR has to be covered. For TC members, they are committed by joining and
being on the roster. For any non-TC members, contribution has to be done
via the comment list to gain the equivalent commitment. That protection for
the TC and Oasis is the key thing I look for.

On Thu, May 18, 2023 at 2:47=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:

> Chet, all,
>
> In fact TC voted to conduct all business by electronic ballot, without
> meetings.
>
> Both non-TC and TC members will inevitably meet to discuss things like
> their plans or implementation efforts. We hardly can, or want to,
> prevent that. However:
> Any such meetings are not mandatory to maintain voting rights. Anything
> discussed in such meetings has no force as a TC decision. Such a meeting
> will not be listed in the TC calendar. Neither can material be solely
> presented in such a meeting or in the doc linked - it has to be posted
> to the mailing list to be considered for inclusion in the specification.
>
> In particular all this applies to the Virtio-networking upstream
> biweekly meeting - this is not a TC meeting, but some TC members attend
> it.
>
>
>
> On Thu, May 18, 2023 at 12:53:41PM -0400, Chet Ensign wrote:
> > Just a reminder everyone that you must be a TC member to participate in
> TC
> > meetings. Eugenio, Ariel, I don't see you on the roster. Let me know if
> you
> > need directions on how to set up your OASIS logins as Redhat employees.
> >
> > Thanks,
> >
> > /chet
> >
> > On Thu, May 18, 2023 at 5:33=E2=80=AFAM Eugenio Perez Martin <
> eperezma@redhat.com>
> > wrote:
> >
> >     On Thu, May 18, 2023 at 7:48=E2=80=AFAM Ariel Adam <aadam@redhat.co=
m> wrote:
> >     >
> >     > The "Virtio-networking upstream biweekly meeting" which happens o=
n
> >     Wednesday's every 2 weeks (led by Eugenio and Jason) was meant to
> get all
> >     the companies interested in virtio networking together to help move
> things
> >     forward (both virtio-networking/spec and vDPA).
> >     >
> >     > See meeting notes from previous meetings: https://docs.google.com=
/
> >     document/d/1FoPi81zQmo5y20G0Yntg-eGHX14LnWc63TwR57mCbs4/edit#
> >     >
> >     > Why not use that meeting and just add more topics given that a lo=
t
> of the
> >     relevant companies already join this meeting?
> >     >
> >
> >     Yes, that fits perfectly with the purpose of the meeting. And it ha=
s
> >     been used in the past to discuss AQ if I recall correctly.
> >
> >     The shared document is already open for writing so everybody can
> >     propose new topics.
> >
> >     Thanks for bringing it to the discussion!
> >
> >     > Thanks.
> >     >
> >     > On Thu, May 18, 2023 at 3:54=E2=80=AFAM Parav Pandit <parav@nvidi=
a.com>
> wrote:
> >     >>
> >     >> Hi all,
> >     >>
> >     >> At the moment to my knowledge, many TC members are working on
> many new
> >     features for virtio network device specification - all of us workin=
g
> in
> >     parallel.
> >     >>
> >     >> I feel a biweekly meeting would help us virtio networking
> developers
> >     collaborate more effectively.
> >     >> For example, we can discuss how do features each one is working =
on
> >     interact, what timeframe is each one targeting, etc.
> >     >>
> >     >> I suggest:
> >     >> - A biweekly meeting using google meet.
> >     >> - Meeting agenda will be posted on list before a week so people
> >     >>   will have a full week to review, respond on the existing maili=
ng
> >     lists.
> >     >> - If no agenda items for that meeting day, meeting will be
> cancelled.
> >     >> - Minutes will be posted on list after a meeting.
> >     >> - non-TC members can also join; this is an additional space to
> get input
> >     >>   from outside experts, under the existing terms of OASIS feedba=
ck
> >     license.
> >     >>
> >     >> - All decisions are still made by TC electronic ballot as usual.
> >     Proposed collaboration
> >     >>   meetings are unrelated to TC ballot. The point is ability to
> >     collaborate,
> >     >>   plan and split work better between developers working in the
> same spec
> >     area.
> >     >>
> >     >> For the first meeting, I propose the following agenda item:
> >     >> - discuss new virtio net device features for 1.4 spec release
> >     >>
> >     >> I suggest several day & time slots.
> >     >> Days:
> >     >> - Tue (May 30) or
> >     >> - Wed (May 31)
> >     >> Time:
> >     >> - 2 pm GMT, or
> >     >> - 5 am GMT
> >     >>
> >     >> We can pick other time/day options as well depending on who want=
s
> to
> >     attend and in which time zone.
> >     >>
> >     >> If all this sounds interesting to you, if you would like to
> attend this
> >     and hopefully future collaboration meetings,
> >     >> please reply with email, cc to list:
> >     >> a. preferred time slots that work for you.
> >     >> b. any items you would like to add to above agenda.
> >     >>
> >     >> Any other comments, suggestions?
> >     >>
> >     >> Regards,
> >     >> Parav Pandit
> >     >>
> >     >> This publicly archived list offers a means to provide input to t=
he
> >     >> OASIS Virtual I/O Device (VIRTIO) TC.
> >     >>
> >     >> In order to verify user consent to the Feedback License terms an=
d
> >     >> to minimize spam in the list archive, subscription is required
> >     >> before posting.
> >     >>
> >     >> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >     >> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >     >> List help: virtio-comment-help@lists.oasis-open.org
> >     >> List archive:
> https://lists.oasis-open.org/archives/virtio-comment/
> >     >> Feedback License: https://www.oasis-open.org/who/ipr/
> >     feedback_license.pdf
> >     >> List Guidelines: https://www.oasis-open.org/policies-guidelines/
> >     mailing-lists
> >     >> Committee: https://www.oasis-open.org/committees/virtio/
> >     >> Join OASIS: https://www.oasis-open.org/join/
> >     >>
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
> >
> >
> > --
> >            Chet Ensign
> >
> >            Chief Technical                      [p]  +1 201-341-1393
> > [AIorK4wW] Community Steward                    [e]
> chet.ensign@oasis-open.org
> >                                                 [l]  www.oasis-open.org
> >            OASIS Open
> >
>
>
> ---------------------------------------------------------------------
> To unsubscribe from this mail list, you must leave the OASIS TC that
> generates this mail.  Follow this link to all your TCs in OASIS at:
> https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php
>
>

--=20
Chet Ensign

Chief Technical Community Steward

OASIS Open

+1 201-341-1393 <+1+201-341-1393>
chet.ensign@oasis-open.org
www.oasis-open.org

--000000000000607a1b05fbfc8cb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, Michael. I knew the TC operates that way so I foun=
d the exchange confusing.=C2=A0<div><br></div><div>The key issue here is IP=
R commitments that go with contributions. When someone makes a contribution=
 to the TC - chunk of code or whatever - their IPR has to be covered. For T=
C members, they are committed by joining and being on the roster. For any n=
on-TC members, contribution has to be done via the comment list to gain the=
 equivalent commitment. That protection for the TC and Oasis is the key thi=
ng I look for.=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, May 18, 2023 at 2:47=E2=80=AFPM Michael S=
. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Chet, all,<br=
>
<br>
In fact TC voted to conduct all business by electronic ballot, without<br>
meetings.<br>
<br>
Both non-TC and TC members will inevitably meet to discuss things like<br>
their plans or implementation efforts. We hardly can, or want to,<br>
prevent that. However:<br>
Any such meetings are not mandatory to maintain voting rights. Anything<br>
discussed in such meetings has no force as a TC decision. Such a meeting<br=
>
will not be listed in the TC calendar. Neither can material be solely<br>
presented in such a meeting or in the doc linked - it has to be posted<br>
to the mailing list to be considered for inclusion in the specification.<br=
>
<br>
In particular all this applies to the Virtio-networking upstream<br>
biweekly meeting - this is not a TC meeting, but some TC members attend<br>
it.<br>
<br>
<br>
<br>
On Thu, May 18, 2023 at 12:53:41PM -0400, Chet Ensign wrote:<br>
&gt; Just a reminder everyone that you must be a TC member to participate i=
n TC<br>
&gt; meetings. Eugenio, Ariel, I don&#39;t see you on the roster. Let me kn=
ow if you<br>
&gt; need directions on how to set up your OASIS logins as Redhat employees=
.=C2=A0<br>
&gt; <br>
&gt; Thanks,=C2=A0<br>
&gt; <br>
&gt; /chet=C2=A0<br>
&gt; <br>
&gt; On Thu, May 18, 2023 at 5:33=E2=80=AFAM Eugenio Perez Martin &lt;<a hr=
ef=3D"mailto:eperezma@redhat.com" target=3D"_blank">eperezma@redhat.com</a>=
&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, May 18, 2023 at 7:48=E2=80=AFAM Ariel Adam =
&lt;<a href=3D"mailto:aadam@redhat.com" target=3D"_blank">aadam@redhat.com<=
/a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The &quot;Virtio-networking upstream biweekly =
meeting&quot; which happens on<br>
&gt;=C2=A0 =C2=A0 =C2=A0Wednesday&#39;s every 2 weeks (led by Eugenio and J=
ason) was meant to get all<br>
&gt;=C2=A0 =C2=A0 =C2=A0the companies interested in virtio networking toget=
her to help move things<br>
&gt;=C2=A0 =C2=A0 =C2=A0forward (both virtio-networking/spec and vDPA).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; See meeting notes from previous meetings: <a h=
ref=3D"https://docs.google.com/" rel=3D"noreferrer" target=3D"_blank">https=
://docs.google.com/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0document/d/1FoPi81zQmo5y20G0Yntg-eGHX14LnWc63TwR57m=
Cbs4/edit#<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Why not use that meeting and just add more top=
ics given that a lot of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0relevant companies already join this meeting?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Yes, that fits perfectly with the purpose of the me=
eting. And it has<br>
&gt;=C2=A0 =C2=A0 =C2=A0been used in the past to discuss AQ if I recall cor=
rectly.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The shared document is already open for writing so =
everybody can<br>
&gt;=C2=A0 =C2=A0 =C2=A0propose new topics.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks for bringing it to the discussion!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, May 18, 2023 at 3:54=E2=80=AFAM Parav =
Pandit &lt;<a href=3D"mailto:parav@nvidia.com" target=3D"_blank">parav@nvid=
ia.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Hi all,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; At the moment to my knowledge, many TC mem=
bers are working on many new<br>
&gt;=C2=A0 =C2=A0 =C2=A0features for virtio network device specification - =
all of us working in<br>
&gt;=C2=A0 =C2=A0 =C2=A0parallel.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; I feel a biweekly meeting would help us vi=
rtio networking developers<br>
&gt;=C2=A0 =C2=A0 =C2=A0collaborate more effectively.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; For example, we can discuss how do feature=
s each one is working on<br>
&gt;=C2=A0 =C2=A0 =C2=A0interact, what timeframe is each one targeting, etc=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; I suggest:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - A biweekly meeting using google meet.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - Meeting agenda will be posted on list be=
fore a week so people<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0will have a full week to revie=
w, respond on the existing mailing<br>
&gt;=C2=A0 =C2=A0 =C2=A0lists.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - If no agenda items for that meeting day,=
 meeting will be cancelled.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - Minutes will be posted on list after a m=
eeting.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - non-TC members can also join; this is an=
 additional space to get input<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0from outside experts, under th=
e existing terms of OASIS feedback<br>
&gt;=C2=A0 =C2=A0 =C2=A0license.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - All decisions are still made by TC elect=
ronic ballot as usual.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Proposed collaboration<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0meetings are unrelated to TC b=
allot. The point is ability to<br>
&gt;=C2=A0 =C2=A0 =C2=A0collaborate,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0plan and split work better bet=
ween developers working in the same spec<br>
&gt;=C2=A0 =C2=A0 =C2=A0area.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; For the first meeting, I propose the follo=
wing agenda item:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - discuss new virtio net device features f=
or 1.4 spec release<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; I suggest several day &amp; time slots.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Days:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - Tue (May 30) or<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - Wed (May 31)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Time:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - 2 pm GMT, or<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - 5 am GMT<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; We can pick other time/day options as well=
 depending on who wants to<br>
&gt;=C2=A0 =C2=A0 =C2=A0attend and in which time zone.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; If all this sounds interesting to you, if =
you would like to attend this<br>
&gt;=C2=A0 =C2=A0 =C2=A0and hopefully future collaboration meetings,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; please reply with email, cc to list:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; a. preferred time slots that work for you.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; b. any items you would like to add to abov=
e agenda.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Any other comments, suggestions?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Parav Pandit<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; This publicly archived list offers a means=
 to provide input to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; OASIS Virtual I/O Device (VIRTIO) TC.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; In order to verify user consent to the Fee=
dback License terms and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; to minimize spam in the list archive, subs=
cription is required<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; before posting.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Subscribe: <a href=3D"mailto:virtio-commen=
t-subscribe@lists.oasis-open.org" target=3D"_blank">virtio-comment-subscrib=
e@lists.oasis-open.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Unsubscribe: <a href=3D"mailto:virtio-comm=
ent-unsubscribe@lists.oasis-open.org" target=3D"_blank">virtio-comment-unsu=
bscribe@lists.oasis-open.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; List help: <a href=3D"mailto:virtio-commen=
t-help@lists.oasis-open.org" target=3D"_blank">virtio-comment-help@lists.oa=
sis-open.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; List archive: <a href=3D"https://lists.oas=
is-open.org/archives/virtio-comment/" rel=3D"noreferrer" target=3D"_blank">=
https://lists.oasis-open.org/archives/virtio-comment/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Feedback License: <a href=3D"https://www.o=
asis-open.org/who/ipr/" rel=3D"noreferrer" target=3D"_blank">https://www.oa=
sis-open.org/who/ipr/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0feedback_license.pdf<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; List Guidelines: <a href=3D"https://www.oa=
sis-open.org/policies-guidelines/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://www.oasis-open.org/policies-guidelines/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0mailing-lists<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Committee: <a href=3D"https://www.oasis-op=
en.org/committees/virtio/" rel=3D"noreferrer" target=3D"_blank">https://www=
.oasis-open.org/committees/virtio/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Join OASIS: <a href=3D"https://www.oasis-o=
pen.org/join/" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.=
org/join/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
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
&gt; <br>
&gt; <br>
&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Chet=C2=A0Ensign<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Chief Technical=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [p]=C2=A0 +1=
 201-341-1393<br>
&gt; [AIorK4wW] Community Steward=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 [e]=C2=A0 <a href=3D"mailto:chet.ensign@o=
asis-open.org" target=3D"_blank">chet.ensign@oasis-open.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[l]=C2=A0 <a href=3D"http://www.oasis-open.o=
rg" rel=3D"noreferrer" target=3D"_blank">www.oasis-open.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OASIS Open<br>
&gt; <br>
<br>
<br>
---------------------------------------------------------------------<br>
To unsubscribe from this mail list, you must leave the OASIS TC that <br>
generates this mail.=C2=A0 Follow this link to all your TCs in OASIS at:<br=
>
<a href=3D"https://www.oasis-open.org/apps/org/workgroup/portal/my_workgrou=
ps.php" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/app=
s/org/workgroup/portal/my_workgroups.php</a> <br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><table cellspacing=3D"0" cellpadding=3D"0" style=3D"font-fam=
ily:Arial;vertical-align:-webkit-baseline-middle"><tbody><tr><td width=3D"7=
0" style=3D"vertical-align:middle"><span style=3D"margin-right:5px;display:=
block"><img width=3D"70" height=3D"70" style=3D"max-width: 70px;" src=3D"ht=
tps://ci3.googleusercontent.com/mail-sig/AIorK4wWWvttK4QvAyLjmQRfbisd2jdvX8=
4ncnFeBuJn9NtWvi8WHJIwVlm1HGm8Re2Ji0U6N10brtc"></span></td><td style=3D"ver=
tical-align:middle"><h3 style=3D"margin:0px;font-size:16px;color:rgb(0,0,0)=
">Chet=C2=A0Ensign</h3><p style=3D"margin:0px;color:rgb(0,0,0);font-size:12=
px;line-height:20px">Chief Technical Community Steward</p><p style=3D"margi=
n:0px;color:rgb(0,0,0);font-size:12px;line-height:20px">OASIS Open</p></td>=
<td width=3D"30">=C2=A0</td><td width=3D"1" style=3D"width:1px;border-botto=
m:none;border-left:1px solid rgb(34,72,229)">=C2=A0</td><td width=3D"30">=
=C2=A0</td><td style=3D"vertical-align:middle"><table cellspacing=3D"0" cel=
lpadding=3D"0" style=3D"vertical-align:-webkit-baseline-middle;font-family:=
Arial"><tbody><tr style=3D"vertical-align:middle"><td width=3D"30" style=3D=
"vertical-align:middle"><table cellspacing=3D"0" cellpadding=3D"0" style=3D=
"vertical-align:-webkit-baseline-middle;font-family:Arial"><tbody><tr><td s=
tyle=3D"vertical-align:bottom"><span style=3D"display:block;background-colo=
r:rgb(34,72,229)"><img src=3D"https://cdn2.hubspot.net/hubfs/53/tools/email=
-signature-generator/icons/phone-icon-2x.png" width=3D"13" style=3D"display=
: block;"></span></td></tr></tbody></table></td><td style=3D"padding:2px;co=
lor:rgb(0,0,0)"><a href=3D"tel:+1+201-341-1393" style=3D"color:rgb(0,0,0);f=
ont-size:12px" target=3D"_blank">+1 201-341-1393</a></td></tr><tr style=3D"=
vertical-align:middle"><td width=3D"30" style=3D"vertical-align:middle"><ta=
ble cellspacing=3D"0" cellpadding=3D"0" style=3D"vertical-align:-webkit-bas=
eline-middle;font-family:Arial"><tbody><tr><td style=3D"vertical-align:bott=
om"><span style=3D"display:block;background-color:rgb(34,72,229)"><img src=
=3D"https://cdn2.hubspot.net/hubfs/53/tools/email-signature-generator/icons=
/email-icon-2x.png" width=3D"13" style=3D"display: block;"></span></td></tr=
></tbody></table></td><td style=3D"padding:2px"><a href=3D"mailto:chet.ensi=
gn@oasis-open.org" style=3D"color:rgb(0,0,0);font-size:12px" target=3D"_bla=
nk">chet.ensign@oasis-open.org</a></td></tr><tr style=3D"vertical-align:mid=
dle"><td width=3D"30" style=3D"vertical-align:middle"><table cellspacing=3D=
"0" cellpadding=3D"0" style=3D"vertical-align:-webkit-baseline-middle;font-=
family:Arial"><tbody><tr><td style=3D"vertical-align:bottom"><span style=3D=
"display:block;background-color:rgb(34,72,229)"><img src=3D"https://cdn2.hu=
bspot.net/hubfs/53/tools/email-signature-generator/icons/link-icon-2x.png" =
width=3D"13" style=3D"display: block;"></span></td></tr></tbody></table></t=
d><td style=3D"padding:2px"><a href=3D"https://www.oasis-open.org" style=3D=
"color:rgb(0,0,0);font-size:12px" target=3D"_blank">www.oasis-open.org</a><=
/td></tr></tbody></table></td></tr></tbody></table></div></div>

--000000000000607a1b05fbfc8cb9--
