Return-Path: <virtio-comment-return-8335-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74534C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 03:35:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C4C5933988
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 03:35:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A98FB9866EE
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 03:35:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9BA829865BD; Mon, 13 Nov 2023 03:35:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9BF4F9865C1
	for <virtio-comment@lists.oasis-open.org>; Mon, 13 Nov 2023 03:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: dNUtAq1oOaqWV1NTzbTd9A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699846498; x=1700451298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2c4YmqPnLwqOn9Vm2FtVfJuKKUD7CR13Hejrhs4Y1OQ=;
        b=CQ8uvIOlBKmtt0MVdyW0MH9XqHynqvj8Q8akpfmbM17XJJ0BywI/5vRsls719bGxw5
         XcysuZ9QLD/HBR/A+Z7Wq6jYsm2B5VO0Z8pcQ6oS2WGqL/+Io+ACTWxPql2qIWVIwZCi
         YhhTJWMJyGziijDDmnAMHSCcVjdWzT6vPUZQ8FYTNxsa/AHkYder5byREv6Q6Q2JSch2
         L1csqh2wf+9VzeDqZqjvD/XMsJZ4JyD4LUE/3K4cOdJtvUgVnuKa4mOj87QmZ7ST9GWx
         4D43HdoqvmOK6b/stmAutge5DIOSDfFMsupFHF+z/ur9/lCz+R9cO86b75nh+2FEEJqT
         2P2w==
X-Gm-Message-State: AOJu0Yz47aOSCepMPA3zEbeN6iobc0XGy0Nyt2Bshk373BXmfyN4yxQp
	+aIXribrrs6RJ+aM3t/wYoO+iObVES6XyupPpGHfty9Eew8rJHHkaM/PDZsu072NUrVnNUEMH48
	L+OUc5fUw/moa8r+Xz4e/kCRz5q2VBeMD2lJJm4GA8KvnHia5QQ==
X-Received: by 2002:a19:5e47:0:b0:509:476a:ee51 with SMTP id z7-20020a195e47000000b00509476aee51mr3338106lfi.20.1699846498672;
        Sun, 12 Nov 2023 19:34:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHs7HlGgHDXa6HC93QeA/+BM2U++RxvXf+w8idSnLA0gd8Er4CzC6VaLVpZ5TVOGU+K1YG+cJm58eJxvzsqzgI=
X-Received: by 2002:a19:5e47:0:b0:509:476a:ee51 with SMTP id
 z7-20020a195e47000000b00509476aee51mr3338101lfi.20.1699846498384; Sun, 12 Nov
 2023 19:34:58 -0800 (PST)
MIME-Version: 1.0
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-4-lingshan.zhu@intel.com> <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com> <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com> <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 13 Nov 2023 11:34:46 +0800
Message-ID: <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH V2 3/6] virtio: dont reset vqs when SUSPEND

On Thu, Nov 9, 2023 at 6:16=E2=80=AFPM Parav Pandit <parav@nvidia.com> wrot=
e:
>
>
> > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > Sent: Thursday, November 9, 2023 3:28 PM
> >
> > On 11/9/2023 1:46 AM, Michael S. Tsirkin wrote:
> > > On Tue, Nov 07, 2023 at 05:27:23PM +0800, Zhu, Lingshan wrote:
> > >>
> > >> On 11/6/2023 5:49 PM, Michael S. Tsirkin wrote:
> > >>> On Fri, Nov 03, 2023 at 06:34:34PM +0800, Zhu Lingshan wrote:
> > >>>> When SUSPEND is set, device states and virtqueue states should be
> > >>>> stablized, therefore the driver should not reset vqs when SUSPEND
> > >>>> is set in device status.
> > >>>>
> > >>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > >>>> ---
> > >>>>    content.tex | 3 +++
> > >>>>    1 file changed, 3 insertions(+)
> > >>>>
> > >>>> diff --git a/content.tex b/content.tex index bcc9d4b..060b5c2
> > >>>> 100644
> > >>>> --- a/content.tex
> > >>>> +++ b/content.tex
> > >>>> @@ -444,6 +444,9 @@ \subsubsection{Virtqueue Reset}\label{sec:Basi=
c
> > Facilities of a Virtio Device /
> > >>>>    The device MUST reset any state of a virtqueue to the default s=
tate,
> > >>>>    including the available state and the used state.
> > >>>> +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set in
> > >>>> +\field{device status}, the driver SHOULD NOT reset any virtqueues=
.
> > >>>> +
> > >>>>    \drivernormative{\paragraph}{Virtqueue Reset}{Basic Facilities =
of a
> > Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
> > >>>>    After the driver tells the device to reset a queue, the driver
> > >>>> MUST verify that
> > >>> Seems somewhat arbitrary and breaks the claim that the feature is
> > >>> orthogonal and can have uses besides migration.
> > >> when suspended, the device is frozen.
> > >> The driver is aware of this process and so should not reset the vqs =
I think.
> > > Again that is only true because you want to use it for migration.
> > > But then you can't claim it's a generic facility.
> > I don't get it. The device status is a basic facility.
> >
> > We need to SUSPEND the device by setting SUSPEND bit, to stabilize the =
device
> > states for migration.
> Is the PCI's PM time not enough to suspend the device?

Are you saying we don't need virtio reset assuming we had FLR?

Suspending at different layers like rest at different layers.

We have both FLR and virtio reset. The Virtio level function could be
reset without FLR. So did suspend.

That's it.

And if you want to rule P2P behaviours, PCI PM is really the correct
way to go instead of trying to do it at the virtio layer.

> For large device I could imagine it could be short.
>
> In that case if there is suspend the device available, it will be used by=
 the guest driver itself, hypervisor wouldn=E2=80=99t know about it when th=
ose registers are not trapped.
> So we need two ways to suspend.
> One is guest visible, and guest controlled.
> Second is hypervisor control to fulfill the device migration needs.

Can you explain why suspend is special but not reset or why reset can
work but not suspend? If reset can work, so does suspend. If reset
can't, neither does suspend.

For example, can you explain how a system_reset in Qemu can work with
your proposal?

>
> So if you can please take a look if the proposed admin command to freeze/=
stop mode can be used in the emulated register case or not.

Again, if you design those for PCI, it's a layer violation. You have
answered yourself that PM is the right way to go.

> It helps to have the suspend bit in guest control as well with/without em=
ulation mode.

I won't repeat it again. You will find you need a full transport to
satisfy all the requirements.

>
> > This can also be used for debugging I think.
>
> As Michael listed, a dedicated debug interface is usually more useful ins=
tead of in-band.

Well, I've shown you the in-band facilities like debugging via ethtool
and kernel has a lot of other ones. If you have ever tried to debug in
a real production environment, you will find how useful such handy
information is where out-of-band facilities are often dangerous and
usually prohibited or even unsupported.

Thanks


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

