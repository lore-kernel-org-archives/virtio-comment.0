Return-Path: <virtio-comment-return-7893-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC70CDB474
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 03:54:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5294B2A883
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 03:54:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3E266986665
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 03:54:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2B224986659; Mon, 23 Oct 2023 03:54:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1BD18986662
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 03:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: UpStnVPJPVSY0XCBZhC8nA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698033242; x=1698638042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gK+VJG0e1qOPboEPz4QCN770U86kHW9kaYLZ93kHM0=;
        b=ru4VX7bh8y1kwlrc8krRXNF5aQ9u+09VI795OxP5rrKCjFzq5+D9U5c/N+8GF+2aEw
         eJjGnRNdXHT4iZWtUxwdfNX6ezV2OYQ/962wXzi/xR+lIkDm+285NTGu1zZH+stZIypz
         XEaaBE8BklvB/Nw72boby3x3eBMjSInOn4tTQV4VCUS7HLfPYAvfZRqhy+Zi1wVtWyK8
         eCx+sALwYx/EI8dYvvXXagrCZBWHrrEoRlMiRVcXhOCtgvaB4d/he0pnz/xW8YZv9G2w
         MAkto9SNmg5n8ELSMfxjdVT8Fq30MExwRLL2xW089vHI1vpaa/KJG4fH0UTMasczt0af
         TMTA==
X-Gm-Message-State: AOJu0YzTnp1S35O6G3a5Zz1F+7BszC31PCz7GqZE1OWh78vkiMX5uiun
	tcBj2haXkp9Dsr7rUkoA4z2JypN0ksoaHCdHTivXOrPb/mnqYrOSRCfW5TZXB/Be6hQDxYdH8OL
	kC8zZOyqqHe/BIx+dnY/0kWG47Rh5Or7Xm/6Jrl9pkp1GTT0ZOw==
X-Received: by 2002:a19:650f:0:b0:507:984b:f174 with SMTP id z15-20020a19650f000000b00507984bf174mr4359795lfb.48.1698033241845;
        Sun, 22 Oct 2023 20:54:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo7KqVzc/2j3lEkWU/QzkvZjefOepJOSQenYmlueNvs2sPOcSg4MHDAO7xdktuBllH7Qj9L3dseWUEHb3WS1E=
X-Received: by 2002:a19:650f:0:b0:507:984b:f174 with SMTP id
 z15-20020a19650f000000b00507984bf174mr4359791lfb.48.1698033241506; Sun, 22
 Oct 2023 20:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com> <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com> <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org> <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com> <20231020053534-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231020053534-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 23 Oct 2023 11:53:50 +0800
Message-ID: <CACGkMEsb=oa+b1=Tcssnv4hNk24FEk4h7eTvDHHMEYFduKu30w@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Parav Pandit <parav@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Fri, Oct 20, 2023 at 5:41=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Fri, Oct 20, 2023 at 05:31:01PM +0800, Zhu, Lingshan wrote:
> >
> >
> > On 10/19/2023 6:33 PM, Parav Pandit wrote:
> > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > Sent: Thursday, October 19, 2023 2:48 PM
> > > >
> > > > On 10/19/2023 5:14 PM, Michael S. Tsirkin wrote:
> > > > > On Thu, Oct 19, 2023 at 09:13:16AM +0000, Parav Pandit wrote:
> > > > > > > Oh, really? Quite interesting, do you want to move all config=
 space
> > > > > > > fields in VF to admin vq? Have a plan?
> > > > > > Not in my plan for spec 1.4 time frame.
> > > > > > I do not want to divert the discussion, would like to focus on =
device
> > > > migration phases.
> > > > > > Lets please discuss in some other dedicated thread.
> > > > > Possibly, if there's a way to send admin commands to vf itself th=
en
> > > > > Lingshan will be happy?
> > > > still need to prove why admin commands are better than registers.
> > > Virtio spec development is not proof based approach. Please stop aski=
ng for it.
> > >
> > > I tried my best to have technical answer in [1].
> > > I explained that registers simply do not work for passthrough mode
> > > (if this is what you are asking when you are asking prove its better)=
.
> > > They can work for non_passthrough mediated mode.
> > >
> > > A member device may do admin commands using registers. Michael and I =
are discussing presently in the same thread.
> > >
> > > Since there are multiple things to be done for device migration, dedi=
cated register set for each functionality do not scale well, hard to mainta=
in and extend.
> > > A register holding a command content make sense.
> > >
> > > Now, with that, if this can be useful only for non_passthrough, I mad=
e humble request to transport them using AQ, this way, you get all benefits=
 of AQ.
> > > And trying to understand, why AQ cannot possible or inferior?
> > >
> > > If you have commands like suspend/resume device, register or queue tr=
ansport simply don=E2=80=99t work, because it's wrong to bifurcate the devi=
ce with such weird API.
> > > If you want to biferacate for mediation software, it probably makes s=
ense to operate at each VQ level, config space level. Such are very differe=
nt commands than passthrough.
> > > I think vdpa has demonstrated that very well on how to do specific wo=
rk for specific device type. So some of those work can be done using AQ.
> > >
> > > [1] https://lore.kernel.org/virtio-comment/870ace02-f99c-4582-932f-bd=
103362dae9@intel.com/T/#m37743aa924536d0256d6b3b8e83a11c750f28794
> > We have been through your statement for many times.
> > This is not about how many times you repeated, if you think this is tru=
e,
> > you need to prove that with solid evidence.
> >
> >
> > For pass-through, I still recommend you to take a reference of current
> > virito-pci implementation, it works for pass-through, right?
>
> Current migration implementation in e.g. QEMU? It does but it
> traps data path accesses. That, I think we can agree,
> should not be the only option to migrate.
>
> > For scale, I already told you for many times that they are per-device
> > facilities. How can a per-device facility not scale?
> > vDPA works fine on config space.
> >
> > So, if you still insist admin vq is better than config space like in ot=
her
> > thread you have concluded, you may imply that config space interfaces s=
hould
> > be re-factored to admin vq.
>
> There are good arguments that yes, virtio needs a transport for config sp=
ace
> that is DMA based as opposed to memory mapped based.  This is one of the
> things all vendors seem to prefer in IDPF so virtio should have the optio=
n.

Then it is the transport vq or transport over adminq proposal?

Thanks

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

