Return-Path: <virtio-comment-return-6238-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE4FC7EE29
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:20:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0429AEEA0C
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:20:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D8286986674
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:20:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B8DCD986351; Thu,  8 Jun 2023 14:20:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8B88898666A
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 14:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: mEvcF9S_OZS-Uv0SQJ6L5g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686233941; x=1688825941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iu9bqhPWHAx0FmSBpY/ILDfVhP5oG6plPr6+VrJjm1g=;
        b=fCSJlr6W6Uhu91uNHMmWZpmDHna8PgjjDsfYhgFi1nXjdUJU7SWi0IgMPF8IkQJCW0
         RgWrq2K5Pev3gzRMHX9ci0Z2NGYe4/ikH7aWj6aMYVFF48r/f4kxwykoGgiGUYaWJ6UE
         Djv2xXM0LXbutrN/1VDmOi1bUv9XLR+EP/VT59mhmGiMIy3qv7lc0eKyOT+KrQaQbtwv
         vyBeHAvKVE8Ob6/1wFyxDYZjEPwrF02HRabG0Nn6TS//wkbyiNNuAFbrEcmQcIr5taOM
         7kHpXbfpFtqRzfgh9cxP5ZEr41qo9BLwLmoHgmsR4YvRMG53r/lsx+Vvqgvnw3fY+t+0
         GWuQ==
X-Gm-Message-State: AC+VfDwLpYAf8PYtrixvMlWmSEkgSOAF6FMexxQIeQ8VH7L3BWORJ8Gf
	gg7PcbzaOlJyXjn/81Z5miEBD5c0tf0/JZoApRKKHIiO+0GlLM5+4o+lLACXYRZZq++PGHaZFtM
	1/kNOowqsJc4ERv4Ive5Z9xEptdsOk0Iw+1nu0iCJZtTOCcxPdw==
X-Received: by 2002:a0d:e291:0:b0:569:ff01:41b8 with SMTP id l139-20020a0de291000000b00569ff0141b8mr7760617ywe.15.1686233940817;
        Thu, 08 Jun 2023 07:19:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7lo54o1jKLmfZRdHABUazwgzvoiOqKbQD5gitYgGqYu4G6a0H6/ZDBE/Db/2c0Kv+i3N9eXmigJX70LOCygVI=
X-Received: by 2002:a0d:e291:0:b0:569:ff01:41b8 with SMTP id
 l139-20020a0de291000000b00569ff0141b8mr7760505ywe.15.1686233939309; Thu, 08
 Jun 2023 07:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230606175511.2337208-1-eperezma@redhat.com> <20230606175511.2337208-2-eperezma@redhat.com>
 <PH0PR12MB5481D1ACC60311CE48D622CFDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606151520-mutt-send-email-mst@kernel.org> <1686226293.022929-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1686226293.022929-1-xuanzhuo@linux.alibaba.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 8 Jun 2023 16:18:23 +0200
Message-ID: <CAJaqyWdusP1DXGV4==ddVRjh9FaTcu2u-4d03_4kOaf2Zom+GQ@mail.gmail.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Laurent Vivier <lvivier@redhat.com>, 
	Cindy Lu <lulu@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"alvaro.karsz@solid-run.com" <alvaro.karsz@solid-run.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
	Gautam Dawar <gdawar@xilinx.com>, "longpeng2@huawei.com" <longpeng2@huawei.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, "stefanha@redhat.com" <stefanha@redhat.com>, 
	Harpreet Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Heng Qi <hengqi@linux.alibaba.com>, "jasowang@redhat.com" <jasowang@redhat.com>, 
	Zhu Lingshan <lingshan.zhu@intel.com>, Shannon Nelson <snelson@pensando.io>, 
	Max Gurtovoy <mgurtovoy@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>, 
	Parav Pandit <parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH 1/2] virtio: introduce selective
 queue enabling

On Thu, Jun 8, 2023 at 2:24=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.co=
m> wrote:
>
> On Tue, 6 Jun 2023 15:19:53 -0400, "Michael S. Tsirkin" <mst@redhat.com> =
wrote:
> > On Tue, Jun 06, 2023 at 06:04:32PM +0000, Parav Pandit wrote:
> > > Hi Eugenio,
> > >
> > > > From: Eugenio P=E9=96=9Eez <eperezma@redhat.com>
> > > > Sent: Tuesday, June 6, 2023 1:55 PM
> > > >
> > > > This patch allows the driver to start the device (as set DRIVER_OK)=
 with only
> > > > some queues enabled, and then enable another queues later.
> > > >
> > > > This is the current way to migrate net device state through control=
 virtqueue, in
> > > > a software assisted framework with vDPA:
> > > > * First, only net CVQ is enabled at DRIVER_OK
> > > > * All the control commands (mac address, mq, etc) needed for the de=
vice to
> > > > behave the same as the source of migration are sent
> > > > * Finally all the dataplane queues are enabled.
> > > >
> > > > Signed-off-by: Eugenio P=E9=96=9Eez <eperezma@redhat.com>
> > > > ---
> > > >  content.tex | 15 +++++++++++++--
> > > >  1 file changed, 13 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/content.tex b/content.tex
> > > > index d2ab9eb..ea4a6d8 100644
> > > > --- a/content.tex
> > > > +++ b/content.tex
> > > > @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Faciliti=
es of a
> > > > Virtio Device / Feature B  \begin{description}
> > > >  \item[0 to 23, and 50 to 127] Feature bits for the specific device=
 type
> > > >
> > > > -\item[24 to 41] Feature bits reserved for extensions to the queue =
and
> > > > +\item[24 to 42] Feature bits reserved for extensions to the queue =
and
> > > >    feature negotiation mechanisms
> > > >
> > > > -\item[42 to 49, and 128 and above] Feature bits reserved for futur=
e extensions.
> > > > +\item[43 to 49, and 128 and above] Feature bits reserved for futur=
e
> > > > extensions.
> > > >  \end{description}
> > > >
> > > >  \begin{note}
> > > > @@ -398,6 +398,13 @@ \section{Virtqueues}\label{sec:Basic Facilitie=
s of a
> > > > Virtio Device / Virtqueues}  Every driver and device supports eithe=
r the Packed
> > > > or the Split  Virtqueue format, or both.
> > > >
> > > > +\subsection{Virtqueue selective enabling}\label{sec:Basic Faciliti=
es of
> > > > +a Virtio Device / Virtqueues / Selective Virtqueue Enable}
> > > > +
> > > > +If the driver negotiates VIRTIO\_F\_RING\_ENABLE\_ANYTIME, it can
> > > > +enable individual virtqueues both before and after the DRIVER\_OK.=
 The
> > > > +way to enable a virtqueue is transport specific, but it mimics the
> > > > +re-enabling after an hypothetical reset.
> > > > +
> > > >  \subsection{Virtqueue Reset}\label{sec:Basic Facilities of a Virti=
o Device /
> > > > Virtqueues / Virtqueue Reset}
> > > >
> > > >  When VIRTIO_F_RING_RESET is negotiated, the driver can reset a vir=
tqueue
> > > > @@ -870,6 +877,10 @@ \chapter{Reserved Feature Bits}\label{sec:Rese=
rved
> > > > Feature Bits}
> > > >   \ref{devicenormative:Basic Facilities of a Virtio Device / Featur=
e Bits} for
> > > >   handling features reserved for future use.
> > > >
> > > > +  \item[VIRTIO_F_RING_ENABLE_ANYTIME(42)] This feature indicates  =
that
> > > > + the driver can enable a queue both before and after DRIVER\_OK.
> > > > +  See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / =
Selective
> > > > Virtqueue Enable}.
> > > > +
> > >
> > > Can you please highlight, current spec normative which indicates that
> > > all queues must be enabled before DRIVER_OK and more queues cannot be
> > > enabled after DRIVER_OK?
> >
> >
> > This one:
> > \drivernormative{\subsection}{Device Initialization}{General Initializa=
tion And Device Operation / Device Initialization}
> >
> > it does not say "all queues" if you want to split hairs but I think
> > assuming it's safe to enable queues later is dangerous.
>
> Although there is no "all queues" here, if the queue is not ready, the de=
vice
> may use all the queues after "Device OK". So I also think it might be dan=
gerous.
>
> But I also ran into this problem. We want the device to support 100 queue=
s, but
> we also want to use only 16 queues by default. The user can then manually=
 scale
> up to 100, if the user has a large memory.
>
> So I think, the point is that "num_queues" is the max and default value. =
Can we
> change "num_queues" to default, then we introduced a new value as max.
>
> Does this way solve your problem? @Eugenio
>

It would need a tweak, but it gives me an idea.

I think you're talking about what the device offers, isn't it? I would
need to modify it from the driver.

But it has an interesting question, how to allocate "less vrings" than
virtio_pci_common_cfg.num_queues? I guess it is ok to set all vq
addresses to a vring that never increments avail_idx? The driver still
needs to allocate memory for that one and lose start time configuring
them.

Maybe for net is valid to leave them unconfigured? it should only use
one vq pair and CVQ by default.

My proposal could be done at the virtio-net level, allowing
max_virtqueue_pairs to be 0 from the beginning. For example, allowing
the driver to write it before DRIVER_OK. In that case, no data vq is
enabled and only CVQ process requests after DRIVER_OK. After all the
config is written, the driver changes the number of active queues with
VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET.

I think it is better solved in a generic way, but I'm ok with this
-net specific too.

Thanks!

> Thanks.
>
>
>
> >
> > E.g. vhost user backends tend to assume no new queues appear
> > after DRIVER_OK.
> >
> > --
> > MST
> >
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
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

