Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A2540862
	for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 04:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726029525; cv=none; b=VNRTIFWCVpBFNysbJ6j3PL3KBLAPBHuwfNtaGzyNWERx80QA322UN/JoE0ggsYxJrm8z1xP+SQdiXHDyE5bMvdrw0EXvYPApvpBJxawRZ5mYvab3pq5NvgvlqORqXlU0s5+UN94lEHBdaKfti08NcCWWTANUwoVOczJeuMmPHl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726029525; c=relaxed/simple;
	bh=8yaNC5HbTz2cFUpDwDygh7DOnPuzxbf5plqZSF9+jFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VO5Vv7f2WCbuRX/FMOp97zGgNOunNAc4gPQuMuIWsyibDakJf0Y+PudztrYR2yMg0yWN1B9HQQ54SwYzlnkgNiKCt0CthAXXJ+VdE2wk+Fv+kSDmHiy8lYGmWVkbcz42zgAsdXoCKcI9veVfBM++xJlK/LQW4uBEGtpDfCtekMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=idQOOaMO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="idQOOaMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726029522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pR2XM1AXhEvY7sF1ry+a6ehkBlIohAuFgaXq86FfYVE=;
	b=idQOOaMO4ebVbPMJhJ9nS2baQHrViJWd7w2/F/sRzs19n2Mu4Hojbx0hyNQAlcofYj2Blz
	yipiOJ75cjyJNjIhxn15PQMC7V4Yoai3j5fkJHTeSEL/GTx9w10QnUco3YAu+eRs6Cb8O4
	1eeVR1Fru7JcVdm+HzbEpPrWiKxBz2U=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-fVAOi8NhNheECcTPRHkMGA-1; Wed, 11 Sep 2024 00:38:41 -0400
X-MC-Unique: fVAOi8NhNheECcTPRHkMGA-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2d8759255d4so7170986a91.3
        for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 21:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726029520; x=1726634320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pR2XM1AXhEvY7sF1ry+a6ehkBlIohAuFgaXq86FfYVE=;
        b=wEypp2tMo5kAMlLLBhVsLDR5E2faqZqnzj6vXj7peP6FD7/x2vLJtPmHbak2FGspTy
         1XQPDhErrYBh9ltndGZUVdslgwjAbX4/LtDUrp/OAslwcmPKwnMV/20cSwe1TTTfHa/j
         JuV4VYvQHuihR55LK1VXBq2QHPZ/vrbVADoRN473StzfMAnH3snJvpEqXpHBH05Yvyts
         U3mTfUbcSOZGsUsX+qbVsdPrz8R+s8iAUGFUYWLufCyUIfoJYZ76K84knztiIB0l+TXN
         VxER38ozs1szQhgEflcScK5npRbrWeF0RlzD1L7JwhMQLFHgaDFF+XmV4ezk/wIGfAlW
         b0KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOsQ11BY0A5sfW84v8SZD/bRUV/LfpyDWq05sIRzzzU+nWjYuxA7nCe1NbWBfL3qMTTp83kC0E63XrnHLSAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbmDUz6/aX+a+vopf6iRTBfcL279NWDLy4RZCAYhOBufu02WOm
	UIO0yFoSr9OskuwjG9i5Jl4xErRg2elq8va3hMTZIiKzXd1+LPg6hOo5ezmU5IrFSFu1wi+bhOl
	8fJtkh9XhB63yh9vdtLm95fjS2nozkJdbnWha29RYuE//gZ3+0PJTDCiC7XGQKRBbkhlxvItJ3j
	P0V6gXpkELaLHMdR6bwvOY2nMZD9lcMgzksqBETaU=
X-Received: by 2002:a17:90a:ee87:b0:2c8:858:7035 with SMTP id 98e67ed59e1d1-2dad50cbcb1mr17120434a91.25.1726029520233;
        Tue, 10 Sep 2024 21:38:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeuujZynj0esXT2GevHWse8fWVX7r1htpR7Q5WW4nVztlOXyWWB2yrOUH8AE6I9BzujisQWc4nVrNk1/DowyE=
X-Received: by 2002:a17:90a:ee87:b0:2c8:858:7035 with SMTP id
 98e67ed59e1d1-2dad50cbcb1mr17120411a91.25.1726029519754; Tue, 10 Sep 2024
 21:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240910170723.44537-1-parav@nvidia.com> <20240910142850-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87136FC9671ABFF7123A82CADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910162247-mutt-send-email-mst@kernel.org> <IA0PR12MB8713AC1D273671DF459FA254DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <8a42e214-59b1-4085-aec0-0f31be885525@amd.com> <IA0PR12MB871350EE73BFB2B8B60B7E97DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
In-Reply-To: <IA0PR12MB871350EE73BFB2B8B60B7E97DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 11 Sep 2024 12:38:28 +0800
Message-ID: <CACGkMEtUvJhAq9Y-hZ8NroupJgarYhB8qz-cLXNQYrvnoGKgbQ@mail.gmail.com>
Subject: Re: [PATCH] admin: Enable driver to send admin commands before DRIVER_OK
To: Parav Pandit <parav@nvidia.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	Shahaf Shuler <shahafs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 12:12=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
> > From: Zhu Lingshan <lingshan.zhu@amd.com>
> > Sent: Wednesday, September 11, 2024 9:30 AM
> > To: Parav Pandit <parav@nvidia.com>; Michael S. Tsirkin <mst@redhat.com=
>
> > Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com; Shahaf Shuler
> > <shahafs@nvidia.com>
> > Subject: Re: [PATCH] admin: Enable driver to send admin commands before
> > DRIVER_OK
> >
> >
> >
> > On 9/11/2024 11:37 AM, Parav Pandit wrote:
> > >
> > >> From: Michael S. Tsirkin <mst@redhat.com>
> > >> Sent: Wednesday, September 11, 2024 2:06 AM
> > >>
> > >> On Tue, Sep 10, 2024 at 07:01:08PM +0000, Parav Pandit wrote:
> > >>>
> > >>>> From: Michael S. Tsirkin <mst@redhat.com>
> > >>>> Sent: Wednesday, September 11, 2024 12:02 AM
> > >>>>
> > >>>> On Tue, Sep 10, 2024 at 08:07:23PM +0300, Parav Pandit wrote:
> > >>>>> Currently the driver can operate administration commands using
> > >>>>> administration virtqueues. Administration virtqueues must be
> > >>>>> enabled before it reached DRIVER_OK stage similar to all other
> > >>>>> queues. This is a limiting factor.
> > >>>>>
> > >>>>> Many of the device functionalties needs to be discovered and
> > >>>>> configured early enough before the driver reaches the DRIVER_OK
> > >> stage.
> > >>>>> Some examples are:
> > >>>>>
> > >>>>> a. driver wants to dynamically create the virtqueues of virtio-ne=
t
> > >>>>>    device with more parameters, for example header data split,
> > >>>>>    multiple physical addresses.
> > >>>>>    Here, the driver needs to tell PCI device early enough that it=
 no
> > >>>>>    longer uses queue_* registers for non admin queues.
> > >>>>>
> > >>>>> b. driver wants to discover these features and related attributes
> > >>>>>    early enough so it has chance to decide to proceed via admin
> > >>>>>    cmd interface or proceed to DRIVER_OK and follow the current f=
low.
> > >>>>>
> > >>>>> To overcome these limitations, introduce a feature bit that
> > >>>>> enables the driver to send capabilities related admin commands
> > >>>>> before DRIVER_OK via the available interface such as
> > >>>>> administration
> > >> virtqueue.
> > >>>>> Signed-off-by: Parav Pandit <parav@nvidia.com>
> > >>>>
> > >>>> We were there in 1.0 and it's messy. And next thing you do, you
> > >>>> will
> > > Also if you can explain what exactly is the mess, if there is one?
> > As far as I can see, the spec says:
> > Set the DRIVER_OK status bit. At this point the device is =E2=80=9Clive=
=E2=80=9D.
> >
> This patch upgrades this detail. Please read through.
>
> > And no vqs are active before DRIVER_OK. How can the device assume that =
the
> > driver is ready before DRIVER_OK?
> Device does not assume.
> When the feature described in this patch is negotiated, device knows that=
 AQ will be live before DRIVER_OK.
>
> > Why admin vq is special?
> Because it is used to do fundamental device and driver capabilities disco=
very.

Then you need another transport or a control device.

Thanks

> Please read the commit log that describes the motivation.
>
> > The common config space is not enough to init a device?
> No.
> > If you see a gap, how about fix it in the common cfg?
> Admin command is the interface do perform administration work.
>
> >
> > Thanks
> >
> > >
> > >>>> want it before features ok, and we will keep piling up hacks.
> > >>> I don't see any motivation to do before feature bit.
> > >> I do.
> > > Can you please share the motivation, why one wants to enable the AQ
> > before features_ok?
> > > And how would it configure all the basic things to operate a AQ befor=
e, for
> > example, PACKED, VERSION, PLATFORM?
> > >
> > > If the motivation to negotiate device specific features via admin com=
mand,
> > then that is still possible with current proposal.
> > >
> > >> And I keep saying, we need to be proactive, address more than one
> > >> problem with each feature and try to predict what will be needed,
> > >> otherwise it will be a mess of a million conflicting features.
> > >>
> > > Sure. make sense.
> > >
> > >>> Never before features ok, feature negotiation is two ways
> > >>> communication
> > >> that indicates device, that queue notification is coming.
> > >>>> I think that if we want
> > >>>> to do admin commands before VQs are active, we should just add a
> > >> capability
> > >>>> with registers for that. People wanted that anyway.
> > >>>>
> > >>> We discussed before that pci-sig discourages piling up vendor speci=
fic
> > caps.
> > >>> So better to avoid that.
> > >> Well, that's a separate issue. Actually pci endpoint guys already
> > >> want a way to access device without messing up with capabilities.
> > >> So we'll likely create a way to put capabilities in a BAR.
> > >>
> > > So lets take the base line design requirement and see what more optio=
ns do
> > we have.
> > >
> > > a. do not extend pci capability
> > > b. utilize the current q config registers c. have bidirectional
> > > negotiation if driver will use the AQ early enough or not.
> > >
> > > With that what do you propose?
> > > A new register in the BAR instead of feature bits?
> > > How does the driver tell the device after reset and before features o=
k?
> > >
> > >>> An alternative would be to bump up the pci revision_id, which would
> > >>> align
> > >> to pci-sig and its known early enough.
> > >>> Though it does not take away the feature bit because device
> > >>> preparation is
> > >> needed to setup early admin commands.
> > >>> And feature bit can be a good hint to inform that.
> > >>> Only revision_id (from device to driver) is not good enough as ther=
e
> > >>> can be
> > >> large sw stack which may never use it and no point in enabling this
> > >> in the device without driver using it.
> > >>> So feature bit proposed here is self-contained, and its early enoug=
h.
> > >>
> > >> I don't really get what this revision_id discussion is about.
> > >>
> > > I will pause explaining the issue with rev_id for a moment and see wh=
at is the
> > efficient way than proposed?
> > >
> > >>>>
> > >>>>
> > >>>>
> > >>>>> ---
> > >>>>>  admin.tex         | 16 ++++++++++++++++
> > >>>>>  content.tex       | 13 ++++++++++++-
> > >>>>>  transport-pci.tex |  6 ++++++
> > >>>>>  3 files changed, 34 insertions(+), 1 deletion(-)
> > >>>>>
> > >>>>> diff --git a/admin.tex b/admin.tex index 39fc072..95054ed 100644
> > >>>>> --- a/admin.tex
> > >>>>> +++ b/admin.tex
> > >>>>> @@ -334,6 +334,11 @@ \subsection{Group administration
> > >>>>> commands}\label{sec:Basic Facilities of a Virti  supporting
> > >>>>> multiple group types, the list of supported commands  might diffe=
r
> > >>>>> between
> > >>>> different group types.
> > >>>>> +When the driver has negotiated the feature
> > >>>>> +VIRTIO_F_EARLY_CAP_ADMIN_CMD, the driver can use administration
> > >>>>> +commands VIRTIO_ADMIN_CMD_LIST_QUERY,
> > >>>> VIRTIO_ADMIN_CMD_LIST_USE and
> > >>>>> +commands related to device and driver capabilities listed in
> > >> \ref[sec:Basic
> > >>>> Facilities of a Virtio Device / Device groups / Group
> > >>>> administration
> > >> commands
> > >>>> / Device and driver capabilities]{device and driver capabilities}
> > >>>> for the self- group type before the driver indicates DRIVER_OK sta=
tus to
> > the device.
> > >>>>> +
> > >>>>>  \input{admin-cmds-legacy-interface.tex}
> > >>>>>  \input{admin-cmds-capabilities.tex}
> > >>>>>  \input{admin-cmds-resource-objects.tex}
> > >>>>> @@ -608,6 +613,14 @@ \section{Administration
> > >>>>> Virtqueues}\label{sec:Basic Facilities of a Virtio Devic  or
> > >>>>> VIRTIO_ADMIN_STATUS_ENOMEM, then the command MUST NOT
> > >> have
> > >>>> any side effects, making it safe to retry.
> > >>>>> +If VIRTIO_F_EARLY_CAP_ADMIN_CMD feature is negotiated, the
> > device
> > >>>>> +MUST process administration commands related to device and drive=
r
> > >>>>> +capabilities before the driver indicates DRIVER_OK to the device=
.
> > >>>>> +
> > >>>>> +If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_CAP_ADMIN_CMD
> > >> features
> > >>>> are
> > >>>>> +negotiated, the device MUST be able to generate notifications
> > >>>>> +related to the administration virtqueue before the driver
> > >>>>> +indicates DRIVER_OK
> > >> to
> > >>>> the device.
> > >>>>> +
> > >>>>>  \drivernormative{\subsection}{Group administration
> > >>>>> commands}{Basic Facilities of a Virtio Device / Administration
> > >>>>> virtqueues}
> > >>>>>
> > >>>>>  The driver MAY supply device-readable or device-writeable parts
> > >>>>> @@
> > >>>>> -641,3 +654,6 @@ \section{Administration
> > >>>>> Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
> > >>>>>
> > >>>>>  The driver SHOULD retry a command that completed with
> > >> \field{status}
> > >>>>> VIRTIO_ADMIN_STATUS_EAGAIN.
> > >>>>> +
> > >>>>> +When the VIRTIO_F_EARLY_ADMIN_CMD feature is negotiated, the
> > >> driver
> > >>>>> +MAY send commands only to the first administration queue defined
> > >>>>> +by
> > >>>> the specific transport.
> > >>>>> diff --git a/content.tex b/content.tex index c32c218..12f9224
> > >>>>> 100644
> > >>>>> --- a/content.tex
> > >>>>> +++ b/content.tex
> > >>>>> @@ -540,6 +540,8 @@ \section{Device
> > >>>>> Initialization}\label{sec:General
> > >>>> Initialization And Device Oper
> > >>>>>     device, optional per-bus setup, reading and possibly writing =
the
> > >>>>>     device's virtio configuration space, and population of virtqu=
eues.
> > >>>>>
> > >>>>> +\item\label{itm:General Initialization And Device Operation /
> > >>>>> +Device
> > >>>> Initialization / Capabilities Access} Optionally get device
> > >>>> capabilities and
> > >> set
> > >>>> driver capabilities if VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
> > >>>>> +
> > >>>>>  \item\label{itm:General Initialization And Device Operation /
> > >>>>> Device
> > >>>> Initialization / Set DRIVER-OK} Set the DRIVER_OK status bit.  At
> > >>>> this point
> > >> the
> > >>>> device is
> > >>>>>     ``live''.
> > >>>>>  \end{enumerate}
> > >>>>> @@ -550,7 +552,9 @@ \section{Device
> > >>>>> Initialization}\label{sec:General Initialization And Device Oper
> > >>>>> driver MUST NOT continue initialization
> > >> in
> > >>>> that case.
> > >>>>>  The driver MUST NOT send any buffer available notifications to
> > >>>>> -the device before setting DRIVER_OK.
> > >>>>> +the device before setting DRIVER_OK; however, the driver MAY sen=
d
> > >>>>> +buffer available notifications before setting DRIVER_OK if
> > >>>>> +VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
> > >>>>>
> > >>>>>  \subsection{Legacy Interface: Device
> > >>>>> Initialization}\label{sec:General Initialization And Device
> > >>>>> Operation / Device Initialization / Legacy Interface: Device
> > >>>>> Initialization}  Legacy
> > >>>> devices did not support the FEATURES_OK status bit, and thus did @=
@
> > >>>> -
> > >> 879,6
> > >>>> +883,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> > >>>> +Feature
> > >>>> Bits}
> > >>>>>         \ref{devicenormative:Basic Facilities of a Virtio Device =
/
> > >>>>> Feature Bits}
> > >>>> for
> > >>>>>         handling features reserved for future use.
> > >>>>>
> > >>>>> +  \item[VIRTIO_F_EARLY_CAP_ADMIN_CMD(42)] This feature indicates
> > >>>> that the device
> > >>>>> +   exposes an administration command interface which is
> > >>>>> + accessible to
> > >> the
> > >>>> driver
> > >>>>> +   before the driver indicates DRIVER_OK device status. When thi=
s
> > >> feature
> > >>>> is
> > >>>>> +   negotiated, once the the administration commands interface is
> > >>>> configured, it can be
> > >>>>> +   used by the driver to issue administration commands related t=
o
> > >> device
> > >>>> and driver
> > >>>>> +   capabilities.
> > >>>>> +
> > >>>>>  \end{description}
> > >>>>>
> > >>>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved
> > >>>>> Feature Bits} diff --git a/transport-pci.tex b/transport-pci.tex
> > >>>>> index
> > >>>>> 95b08b8..a612b34 100644
> > >>>>> --- a/transport-pci.tex
> > >>>>> +++ b/transport-pci.tex
> > >>>>> @@ -495,6 +495,12 @@ \subsubsection{Common configuration
> > >> structure
> > >>>>> layout}\label{sec:Virtio Transport  to ensure that indices of
> > >>>>> valid admin queues fit into  a 16 bit range beyond all other virt=
queues.
> > >>>>>
> > >>>>> +If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_ADMIN_CMD has been
> > >>>>> +negotiated, the device MUST support administration commands
> > >> through
> > >>>>> +the administration virtqueue identified by the
> > >>>>> +\field{admin_queue_index} after the administration virtqueue is
> > >>>>> +enabled and before the driver sets DRIVER_OK to the
> > >>>> \field{device_status}.
> > >>>>> +
> > >>>>>  \drivernormative{\paragraph}{Common configuration structure
> > >>>>> layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI
> > >>>>> Device Layout / Common configuration structure layout}
> > >>>>>
> > >>>>>  The driver MUST NOT write to \field{device_feature},
> > >>>>> \field{num_queues},
> > >>>>> --
> > >>>>> 2.34.1
> > >
>

