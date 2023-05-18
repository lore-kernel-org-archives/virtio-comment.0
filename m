Return-Path: <virtio-comment-return-5974-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84026C77B7D
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 19:45:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D577C190904
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 19:45:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BE02698671E
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 19:45:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B22CF983E90; Thu, 18 May 2023 19:45:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9F18998671B
	for <virtio-comment@lists.oasis-open.org>; Thu, 18 May 2023 19:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684439140; x=1687031140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vv464JIBnIa/doS0AdNF+O9iLhjpHopPQIUro2dTL1w=;
        b=iU3l2y74eB8TL7fh8ihqVc8/y3+eoEKgvCaGu01j/yiBT+2zkFsz2SBGvWzyCf6YYB
         EJ4RmvWr6fAXKbztWt7YZisRPzKCc/ItdmEuvsLNQbBgReRDCYaisLIV/iEVh8/Umt56
         ApkbjQKDcxlfBVObNzSIL+5VVOfSDG+7YMLmEiH4JPIgsanC7Z+zNWW5Aazdhbl7JMV4
         N/CGlYQC+wreEDbVb5wLDudri4h9HgYvJNXv9nbE7j2/6s/cUrSdD9evFSAwxf+vVWIN
         vu4EToL2SknD8YAohxo4z86SN6+qNJPIEZp6LOU2kMd2b1B0wEUfFSO8l5ABL2AyOv3Z
         lORA==
X-Gm-Message-State: AC+VfDzqTXJa9C+JkiZRP/h2QXDL0Zgh8YUDoW57EqH8yG/hteepK1e9
	2X/IQafPpkVbIsZ9AxjThUrS7Z8vw4rwcrNCWSAhWu0=
X-Google-Smtp-Source: ACHHUZ56WpOKG+c+ob4D3kzaLWCcdm5hTqBsSVgZz7qiZRcdJ2fwLr5SuS/Uvw+wA+tZVD79sa25rP0x99FVjIrGweg=
X-Received: by 2002:a92:d30d:0:b0:32c:a1d1:40c3 with SMTP id
 x13-20020a92d30d000000b0032ca1d140c3mr5053017ila.32.1684439140063; Thu, 18
 May 2023 12:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CANerMUV1vCA9j6QJ+0q93VoUeUkesuv_mToK6o3iz0989OC+Fg@mail.gmail.com>
 <CAJaqyWf1bKrSZOLY3R2KxZxgLnJ1BH=PXzqvatBHmKQs3zgL9A@mail.gmail.com>
 <CAAwgnnMgyWqm9wAU0y7DXt7TAO=TtfPuBW4omFajw=eSeYOc-g@mail.gmail.com>
 <20230518143013-mutt-send-email-mst@kernel.org> <CAAwgnnOfyKsjb-h4OuZXhM0XVH1xvn5cfZMUXG=xwJZ7qBjEig@mail.gmail.com>
 <20230518151424-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230518151424-mutt-send-email-mst@kernel.org>
From: Chet Ensign <chet.ensign@oasis-open.org>
Date: Thu, 18 May 2023 15:45:29 -0400
Message-ID: <CAAwgnnMcR8GpLpVAmbW+dXdhag4g3_C6K2FiFbJCr5MnedM8Og@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>, Ariel Adam <aadam@redhat.com>, 
	Parav Pandit <parav@nvidia.com>, 
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Content-Type: multipart/alternative; boundary="00000000000096fbf405fbfd0c1c"
Subject: [virtio-comment] Re: [virtio] Re: [virtio-comment] virtio networking collaboration
 meeting: call for agenda

--00000000000096fbf405fbfd0c1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks very much, Michael. I appreciate you taking the time to go through
that.

On Thu, May 18, 2023 at 3:32=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:

> Well this is why I said:
> >     Neither can material be solely
> >     presented in such a meeting or in the doc linked - it has to be
> posted
> >     to the mailing list to be considered for inclusion in the
> specification.
>
> This should serve to protect the IPR - while people can discuss
> whatever, for things to be in the spec they have to be on list.
>
> As an additional precaution, I think that while subscribing to list is
> one way to agree to the feedback license, another is simply asking
> anyone who is not a TC member to confirm.
>
> Just in case, I also suggested to Eugenio that anyone discussing issues
> connected to a virtio spec is presented with a reminder along the lines
> of:
>
>     By joining the meeting, participants agree that any information share=
d
> in the
>     meeting will be considered submitted by them to the VIRTIO TC,
> according
>     the OASIS Intellectual Property Rights (IPR) Policy
>     https://www.oasis-open.org/policies-guidelines/ipr
>
> Hope this helps.
>
> On Thu, May 18, 2023 at 03:09:38PM -0400, Chet Ensign wrote:
> > Thanks, Michael. I knew the TC operates that way so I found the exchang=
e
> > confusing.
> >
> > The key issue here is IPR commitments that go with contributions. When
> someone
> > makes a contribution to the TC - chunk of code or whatever - their IPR
> has to
> > be covered. For TC members, they are committed by joining and being on
> the
> > roster. For any non-TC members, contribution has to be done via the
> comment
> > list to gain the equivalent commitment. That protection for the TC and
> Oasis is
> > the key thing I look for.
> >
> > On Thu, May 18, 2023 at 2:47=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com>
> wrote:
> >
> >     Chet, all,
> >
> >     In fact TC voted to conduct all business by electronic ballot,
> without
> >     meetings.
> >
> >     Both non-TC and TC members will inevitably meet to discuss things
> like
> >     their plans or implementation efforts. We hardly can, or want to,
> >     prevent that. However:
> >     Any such meetings are not mandatory to maintain voting rights.
> Anything
> >     discussed in such meetings has no force as a TC decision. Such a
> meeting
> >     will not be listed in the TC calendar. Neither can material be sole=
ly
> >     presented in such a meeting or in the doc linked - it has to be
> posted
> >     to the mailing list to be considered for inclusion in the
> specification.
> >
> >     In particular all this applies to the Virtio-networking upstream
> >     biweekly meeting - this is not a TC meeting, but some TC members
> attend
> >     it.
> >
> >
> >
> >     On Thu, May 18, 2023 at 12:53:41PM -0400, Chet Ensign wrote:
> >     > Just a reminder everyone that you must be a TC member to
> participate in
> >     TC
> >     > meetings. Eugenio, Ariel, I don't see you on the roster. Let me
> know if
> >     you
> >     > need directions on how to set up your OASIS logins as Redhat
> employees.
> >     >
> >     > Thanks,
> >     >
> >     > /chet
> >     >
> >     > On Thu, May 18, 2023 at 5:33=E2=80=AFAM Eugenio Perez Martin <
> eperezma@redhat.com
> >     >
> >     > wrote:
> >     >
> >     >     On Thu, May 18, 2023 at 7:48=E2=80=AFAM Ariel Adam <aadam@red=
hat.com>
> wrote:
> >     >     >
> >     >     > The "Virtio-networking upstream biweekly meeting" which
> happens on
> >     >     Wednesday's every 2 weeks (led by Eugenio and Jason) was mean=
t
> to get
> >     all
> >     >     the companies interested in virtio networking together to hel=
p
> move
> >     things
> >     >     forward (both virtio-networking/spec and vDPA).
> >     >     >
> >     >     > See meeting notes from previous meetings:
> https://docs.google.com/
> >     >     document/d/1FoPi81zQmo5y20G0Yntg-eGHX14LnWc63TwR57mCbs4/edit#
> >     >     >
> >     >     > Why not use that meeting and just add more topics given tha=
t
> a lot
> >     of the
> >     >     relevant companies already join this meeting?
> >     >     >
> >     >
> >     >     Yes, that fits perfectly with the purpose of the meeting. And
> it has
> >     >     been used in the past to discuss AQ if I recall correctly.
> >     >
> >     >     The shared document is already open for writing so everybody
> can
> >     >     propose new topics.
> >     >
> >     >     Thanks for bringing it to the discussion!
> >     >
> >     >     > Thanks.
> >     >     >
> >     >     > On Thu, May 18, 2023 at 3:54=E2=80=AFAM Parav Pandit <
> parav@nvidia.com>
> >     wrote:
> >     >     >>
> >     >     >> Hi all,
> >     >     >>
> >     >     >> At the moment to my knowledge, many TC members are working
> on many
> >     new
> >     >     features for virtio network device specification - all of us
> working
> >     in
> >     >     parallel.
> >     >     >>
> >     >     >> I feel a biweekly meeting would help us virtio networking
> >     developers
> >     >     collaborate more effectively.
> >     >     >> For example, we can discuss how do features each one is
> working on
> >     >     interact, what timeframe is each one targeting, etc.
> >     >     >>
> >     >     >> I suggest:
> >     >     >> - A biweekly meeting using google meet.
> >     >     >> - Meeting agenda will be posted on list before a week so
> people
> >     >     >>   will have a full week to review, respond on the existing
> mailing
> >     >     lists.
> >     >     >> - If no agenda items for that meeting day, meeting will be
> >     cancelled.
> >     >     >> - Minutes will be posted on list after a meeting.
> >     >     >> - non-TC members can also join; this is an additional spac=
e
> to get
> >     input
> >     >     >>   from outside experts, under the existing terms of OASIS
> feedback
> >     >     license.
> >     >     >>
> >     >     >> - All decisions are still made by TC electronic ballot as
> usual.
> >     >     Proposed collaboration
> >     >     >>   meetings are unrelated to TC ballot. The point is abilit=
y
> to
> >     >     collaborate,
> >     >     >>   plan and split work better between developers working in
> the
> >     same spec
> >     >     area.
> >     >     >>
> >     >     >> For the first meeting, I propose the following agenda item=
:
> >     >     >> - discuss new virtio net device features for 1.4 spec
> release
> >     >     >>
> >     >     >> I suggest several day & time slots.
> >     >     >> Days:
> >     >     >> - Tue (May 30) or
> >     >     >> - Wed (May 31)
> >     >     >> Time:
> >     >     >> - 2 pm GMT, or
> >     >     >> - 5 am GMT
> >     >     >>
> >     >     >> We can pick other time/day options as well depending on wh=
o
> wants
> >     to
> >     >     attend and in which time zone.
> >     >     >>
> >     >     >> If all this sounds interesting to you, if you would like t=
o
> attend
> >     this
> >     >     and hopefully future collaboration meetings,
> >     >     >> please reply with email, cc to list:
> >     >     >> a. preferred time slots that work for you.
> >     >     >> b. any items you would like to add to above agenda.
> >     >     >>
> >     >     >> Any other comments, suggestions?
> >     >     >>
> >     >     >> Regards,
> >     >     >> Parav Pandit
> >     >     >>
> >     >     >> This publicly archived list offers a means to provide inpu=
t
> to the
> >     >     >> OASIS Virtual I/O Device (VIRTIO) TC.
> >     >     >>
> >     >     >> In order to verify user consent to the Feedback License
> terms and
> >     >     >> to minimize spam in the list archive, subscription is
> required
> >     >     >> before posting.
> >     >     >>
> >     >     >> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >     >     >> Unsubscribe:
> virtio-comment-unsubscribe@lists.oasis-open.org
> >     >     >> List help: virtio-comment-help@lists.oasis-open.org
> >     >     >> List archive:
> https://lists.oasis-open.org/archives/virtio-comment
> >     /
> >     >     >> Feedback License: https://www.oasis-open.org/who/ipr/
> >     >     feedback_license.pdf
> >     >     >> List Guidelines:
> https://www.oasis-open.org/policies-guidelines/
> >     >     mailing-lists
> >     >     >> Committee: https://www.oasis-open.org/committees/virtio/
> >     >     >> Join OASIS: https://www.oasis-open.org/join/
> >     >     >>
> >     >
> >     >
> >     >     This publicly archived list offers a means to provide input t=
o
> the
> >     >     OASIS Virtual I/O Device (VIRTIO) TC.
> >     >
> >     >     In order to verify user consent to the Feedback License terms
> and
> >     >     to minimize spam in the list archive, subscription is require=
d
> >     >     before posting.
> >     >
> >     >     Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >     >     Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >     >     List help: virtio-comment-help@lists.oasis-open.org
> >     >     List archive:
> https://lists.oasis-open.org/archives/virtio-comment/
> >     >     Feedback License: https://www.oasis-open.org/who/ipr/
> >     feedback_license.pdf
> >     >     List Guidelines:
> https://www.oasis-open.org/policies-guidelines/
> >     >     mailing-lists
> >     >     Committee: https://www.oasis-open.org/committees/virtio/
> >     >     Join OASIS: https://www.oasis-open.org/join/
> >     >
> >     >
> >     >
> >     >
> >     > --
> >     >            Chet Ensign
> >     >
> >     >            Chief Technical                      [p]  +1
> 201-341-1393
> >     > [AIorK4wW] Community Steward                    [e]
> >     chet.ensign@oasis-open.org
> >     >                                                 [l]
> www.oasis-open.org
> >     >            OASIS Open
> >     >
> >
> >
> >     -------------------------------------------------------------------=
--
> >     To unsubscribe from this mail list, you must leave the OASIS TC tha=
t
> >     generates this mail.  Follow this link to all your TCs in OASIS at:
> >
> https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php
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

--=20
Chet Ensign

Chief Technical Community Steward

OASIS Open

+1 201-341-1393 <+1+201-341-1393>
chet.ensign@oasis-open.org
www.oasis-open.org

--00000000000096fbf405fbfd0c1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks very much, Michael. I appreciate you taking the tim=
e to go through that.=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, May 18, 2023 at 3:32=E2=80=AFPM Michael =
S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Well this is=
 why I said:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Neither can material be solely<br>
&gt;=C2=A0 =C2=A0 =C2=A0presented in such a meeting or in the doc linked - =
it has to be posted<br>
&gt;=C2=A0 =C2=A0 =C2=A0to the mailing list to be considered for inclusion =
in the specification.<br>
<br>
This should serve to protect the IPR - while people can discuss<br>
whatever, for things to be in the spec they have to be on list.<br>
<br>
As an additional precaution, I think that while subscribing to list is<br>
one way to agree to the feedback license, another is simply asking<br>
anyone who is not a TC member to confirm.<br>
<br>
Just in case, I also suggested to Eugenio that anyone discussing issues<br>
connected to a virtio spec is presented with a reminder along the lines<br>
of:<br>
<br>
=C2=A0 =C2=A0 By joining the meeting, participants agree that any informati=
on shared in the<br>
=C2=A0 =C2=A0 meeting will be considered submitted by them to the VIRTIO TC=
, according<br>
=C2=A0 =C2=A0 the OASIS Intellectual Property Rights (IPR) Policy<br>
=C2=A0 =C2=A0 <a href=3D"https://www.oasis-open.org/policies-guidelines/ipr=
" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/policies-=
guidelines/ipr</a><br>
<br>
Hope this helps.<br>
<br>
On Thu, May 18, 2023 at 03:09:38PM -0400, Chet Ensign wrote:<br>
&gt; Thanks, Michael. I knew the TC operates that way so I found the exchan=
ge<br>
&gt; confusing.=C2=A0<br>
&gt; <br>
&gt; The key issue here is IPR commitments that go with contributions. When=
 someone<br>
&gt; makes a contribution to the TC - chunk of code or whatever - their IPR=
 has to<br>
&gt; be covered. For TC members, they are committed by joining and being on=
 the<br>
&gt; roster. For any non-TC members, contribution has to be done via the co=
mment<br>
&gt; list to gain the equivalent commitment. That protection for the TC and=
 Oasis is<br>
&gt; the key thing I look for.=C2=A0<br>
&gt; <br>
&gt; On Thu, May 18, 2023 at 2:47=E2=80=AFPM Michael S. Tsirkin &lt;<a href=
=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Chet, all,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In fact TC voted to conduct all business by electro=
nic ballot, without<br>
&gt;=C2=A0 =C2=A0 =C2=A0meetings.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Both non-TC and TC members will inevitably meet to =
discuss things like<br>
&gt;=C2=A0 =C2=A0 =C2=A0their plans or implementation efforts. We hardly ca=
n, or want to,<br>
&gt;=C2=A0 =C2=A0 =C2=A0prevent that. However:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Any such meetings are not mandatory to maintain vot=
ing rights. Anything<br>
&gt;=C2=A0 =C2=A0 =C2=A0discussed in such meetings has no force as a TC dec=
ision. Such a meeting<br>
&gt;=C2=A0 =C2=A0 =C2=A0will not be listed in the TC calendar. Neither can =
material be solely<br>
&gt;=C2=A0 =C2=A0 =C2=A0presented in such a meeting or in the doc linked - =
it has to be posted<br>
&gt;=C2=A0 =C2=A0 =C2=A0to the mailing list to be considered for inclusion =
in the specification.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In particular all this applies to the Virtio-networ=
king upstream<br>
&gt;=C2=A0 =C2=A0 =C2=A0biweekly meeting - this is not a TC meeting, but so=
me TC members attend<br>
&gt;=C2=A0 =C2=A0 =C2=A0it.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, May 18, 2023 at 12:53:41PM -0400, Chet Ensi=
gn wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Just a reminder everyone that you must be a TC=
 member to participate in<br>
&gt;=C2=A0 =C2=A0 =C2=A0TC<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; meetings. Eugenio, Ariel, I don&#39;t see you =
on the roster. Let me know if<br>
&gt;=C2=A0 =C2=A0 =C2=A0you<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; need directions on how to set up your OASIS lo=
gins as Redhat employees.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks,=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; /chet=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, May 18, 2023 at 5:33=E2=80=AFAM Eugeni=
o Perez Martin &lt;<a href=3D"mailto:eperezma@redhat.com" target=3D"_blank"=
>eperezma@redhat.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On Thu, May 18, 2023 at 7:4=
8=E2=80=AFAM Ariel Adam &lt;<a href=3D"mailto:aadam@redhat.com" target=3D"_=
blank">aadam@redhat.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; The &quot;Virtio-netwo=
rking upstream biweekly meeting&quot; which happens on<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Wednesday&#39;s every 2 wee=
ks (led by Eugenio and Jason) was meant to get<br>
&gt;=C2=A0 =C2=A0 =C2=A0all<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0the companies interested in=
 virtio networking together to help move<br>
&gt;=C2=A0 =C2=A0 =C2=A0things<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0forward (both virtio-networ=
king/spec and vDPA).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; See meeting notes from=
 previous meetings: <a href=3D"https://docs.google.com/" rel=3D"noreferrer"=
 target=3D"_blank">https://docs.google.com/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0document/d/1FoPi81zQmo5y20G=
0Yntg-eGHX14LnWc63TwR57mCbs4/edit#<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Why not use that meeti=
ng and just add more topics given that a lot<br>
&gt;=C2=A0 =C2=A0 =C2=A0of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0relevant companies already =
join this meeting?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Yes, that fits perfectly wi=
th the purpose of the meeting. And it has<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0been used in the past to di=
scuss AQ if I recall correctly.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0The shared document is alre=
ady open for writing so everybody can<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0propose new topics.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Thanks for bringing it to t=
he discussion!<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, May 18, 2023 a=
t 3:54=E2=80=AFAM Parav Pandit &lt;<a href=3D"mailto:parav@nvidia.com" targ=
et=3D"_blank">parav@nvidia.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Hi all,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; At the moment to m=
y knowledge, many TC members are working on many<br>
&gt;=C2=A0 =C2=A0 =C2=A0new<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0features for virtio network=
 device specification - all of us working<br>
&gt;=C2=A0 =C2=A0 =C2=A0in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0parallel.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; I feel a biweekly =
meeting would help us virtio networking<br>
&gt;=C2=A0 =C2=A0 =C2=A0developers<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0collaborate more effectivel=
y.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; For example, we ca=
n discuss how do features each one is working on<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0interact, what timeframe is=
 each one targeting, etc.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; I suggest:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - A biweekly meeti=
ng using google meet.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - Meeting agenda w=
ill be posted on list before a week so people<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0will h=
ave a full week to review, respond on the existing mailing<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0lists.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - If no agenda ite=
ms for that meeting day, meeting will be<br>
&gt;=C2=A0 =C2=A0 =C2=A0cancelled.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - Minutes will be =
posted on list after a meeting.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - non-TC members c=
an also join; this is an additional space to get<br>
&gt;=C2=A0 =C2=A0 =C2=A0input<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0from o=
utside experts, under the existing terms of OASIS feedback<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0license.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - All decisions ar=
e still made by TC electronic ballot as usual.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Proposed collaboration<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0meetin=
gs are unrelated to TC ballot. The point is ability to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0collaborate,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0plan a=
nd split work better between developers working in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0same spec<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0area.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; For the first meet=
ing, I propose the following agenda item:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - discuss new virt=
io net device features for 1.4 spec release<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; I suggest several =
day &amp; time slots.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Days:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - Tue (May 30) or<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - Wed (May 31)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Time:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - 2 pm GMT, or<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; - 5 am GMT<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; We can pick other =
time/day options as well depending on who wants<br>
&gt;=C2=A0 =C2=A0 =C2=A0to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0attend and in which time zo=
ne.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; If all this sounds=
 interesting to you, if you would like to attend<br>
&gt;=C2=A0 =C2=A0 =C2=A0this<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0and hopefully future collab=
oration meetings,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; please reply with =
email, cc to list:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; a. preferred time =
slots that work for you.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; b. any items you w=
ould like to add to above agenda.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Any other comments=
, suggestions?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Parav Pandit<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; This publicly arch=
ived list offers a means to provide input to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; OASIS Virtual I/O =
Device (VIRTIO) TC.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; In order to verify=
 user consent to the Feedback License terms and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; to minimize spam i=
n the list archive, subscription is required<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; before posting.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Subscribe: <a href=
=3D"mailto:virtio-comment-subscribe@lists.oasis-open.org" target=3D"_blank"=
>virtio-comment-subscribe@lists.oasis-open.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Unsubscribe: <a hr=
ef=3D"mailto:virtio-comment-unsubscribe@lists.oasis-open.org" target=3D"_bl=
ank">virtio-comment-unsubscribe@lists.oasis-open.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; List help: <a href=
=3D"mailto:virtio-comment-help@lists.oasis-open.org" target=3D"_blank">virt=
io-comment-help@lists.oasis-open.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; List archive: <a h=
ref=3D"https://lists.oasis-open.org/archives/virtio-comment" rel=3D"norefer=
rer" target=3D"_blank">https://lists.oasis-open.org/archives/virtio-comment=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0/<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Feedback License: =
<a href=3D"https://www.oasis-open.org/who/ipr/" rel=3D"noreferrer" target=
=3D"_blank">https://www.oasis-open.org/who/ipr/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0feedback_license.pdf<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; List Guidelines: <=
a href=3D"https://www.oasis-open.org/policies-guidelines/" rel=3D"noreferre=
r" target=3D"_blank">https://www.oasis-open.org/policies-guidelines/</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0mailing-lists<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Committee: <a href=
=3D"https://www.oasis-open.org/committees/virtio/" rel=3D"noreferrer" targe=
t=3D"_blank">https://www.oasis-open.org/committees/virtio/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Join OASIS: <a hre=
f=3D"https://www.oasis-open.org/join/" rel=3D"noreferrer" target=3D"_blank"=
>https://www.oasis-open.org/join/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0This publicly archived list=
 offers a means to provide input to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0OASIS Virtual I/O Device (V=
IRTIO) TC.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0In order to verify user con=
sent to the Feedback License terms and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0to minimize spam in the lis=
t archive, subscription is required<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0before posting.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Subscribe: <a href=3D"mailt=
o:virtio-comment-subscribe@lists.oasis-open.org" target=3D"_blank">virtio-c=
omment-subscribe@lists.oasis-open.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe: <a href=3D"mai=
lto:virtio-comment-unsubscribe@lists.oasis-open.org" target=3D"_blank">virt=
io-comment-unsubscribe@lists.oasis-open.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0List help: <a href=3D"mailt=
o:virtio-comment-help@lists.oasis-open.org" target=3D"_blank">virtio-commen=
t-help@lists.oasis-open.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0List archive: <a href=3D"ht=
tps://lists.oasis-open.org/archives/virtio-comment/" rel=3D"noreferrer" tar=
get=3D"_blank">https://lists.oasis-open.org/archives/virtio-comment/</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Feedback License: <a href=
=3D"https://www.oasis-open.org/who/ipr/" rel=3D"noreferrer" target=3D"_blan=
k">https://www.oasis-open.org/who/ipr/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0feedback_license.pdf<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0List Guidelines: <a href=3D=
"https://www.oasis-open.org/policies-guidelines/" rel=3D"noreferrer" target=
=3D"_blank">https://www.oasis-open.org/policies-guidelines/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0mailing-lists<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Committee: <a href=3D"https=
://www.oasis-open.org/committees/virtio/" rel=3D"noreferrer" target=3D"_bla=
nk">https://www.oasis-open.org/committees/virtio/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Join OASIS: <a href=3D"http=
s://www.oasis-open.org/join/" rel=3D"noreferrer" target=3D"_blank">https://=
www.oasis-open.org/join/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Chet=
=C2=A0Ensign<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Chief=
 Technical=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 [p]=C2=A0 +1 201-341-1393<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [AIorK4wW] Community Steward=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 [e]=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:chet.ensign@oasis-open.org" targe=
t=3D"_blank">chet.ensign@oasis-open.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[l]=C2=A0 <a href=3D=
"http://www.oasis-open.org" rel=3D"noreferrer" target=3D"_blank">www.oasis-=
open.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OASIS=
 Open<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0---------------------------------------------------=
------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0To unsubscribe from this mail list, you must leave =
the OASIS TC that<br>
&gt;=C2=A0 =C2=A0 =C2=A0generates this mail.=C2=A0 Follow this link to all =
your TCs in OASIS at:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.oasis-open.org/apps/org/work=
group/portal/my_workgroups.php" rel=3D"noreferrer" target=3D"_blank">https:=
//www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php</a><br>
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

--00000000000096fbf405fbfd0c1c--
