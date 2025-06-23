Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41821EF397
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 08:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665727; cv=none; b=l+J/VUGZtuilP84O3nZVMRrvYteErpefoCj4x4SBn9luOPQVek5Vh8IJCBOigDDSWIXLCxwmc7H1F2yK1yXTCjPrgYKh625zcRTAXl+9vqMMMsOOxX0PaYcdT35+MaKmFf9AkKgo1eGyW4XgMKnx1zBwLzuscVzXlcVcPoDR3Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665727; c=relaxed/simple;
	bh=zcPvt1IV3bB7WPmMU2SZ1HqcMMnfwwG1Jq+xJBhoBaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqgZ1ficVMJNLecZbrU+pRPjBUDLpqRyZv/0cWQ4q/2i+/wLIPJRiNsJ7fog9YBt46Ystx2aVwEnj98UoWBkZFgeRh85MGKEzvWuJDte6HbcjbhJh9A9zTWO4DfhmccbbtlJ/75XBhfj2Dp1lp0H05+S29qUlQK/t4W+tnHO9QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OOEFYG4Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OOEFYG4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750665724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C40ed4WYoCZupVq5GE3h2+m9pgWGBN6S64HfkQ9Y1Kc=;
	b=OOEFYG4Q93VjAtvtA8RR2a73W6oonVBINwA8A4r2mT88q9jxKlLVrXUqfuh94XJFoLYjfX
	mdj6ZccxDM+n3bpsIohMF+4gYx6i/izVP4oTfe3wNDZf6gFZgjRRiVokyTzO7KXq0jmjaY
	rzGXK2mqw8NDQXVE4xuqCn7VTJuzPOE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-aocK5ijSPQacMsUmOC7Lrw-1; Mon, 23 Jun 2025 04:02:02 -0400
X-MC-Unique: aocK5ijSPQacMsUmOC7Lrw-1
X-Mimecast-MFC-AGG-ID: aocK5ijSPQacMsUmOC7Lrw_1750665721
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311ef4fb5fdso3385963a91.1
        for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 01:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665721; x=1751270521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C40ed4WYoCZupVq5GE3h2+m9pgWGBN6S64HfkQ9Y1Kc=;
        b=mDw3fVjL952UlxqQBT3I+MudGoyK0MDxUF8lAU7E6P6sTFJkMfpy2ldsWEgySXgiqI
         bAFbPGj/KUfw/V0RQUs9nKPxI9ijiVFNXr2viH/itidxd7kpyLsOWy4vh106mBfWP38z
         LYIGnr7wcYf6xO9lzDB8p97X/WLkVLZqTrV3YgjUReGKZFwRER6Nmnm3dsOLdsHivacn
         c/FZm8gxN1oBkW6fHAV6qb3A37aWGLKZlvd8PVHT3NRxOMqqnbTXTQDgG8nJBVqwep72
         DNqXUbA0EBbcqtd8gBtaRS0cayQ7knJKzG4JSS6hwxGZPpEKngayLrGlT2H5nGQU3inC
         vmUw==
X-Forwarded-Encrypted: i=1; AJvYcCWi0kpvQIhAilMRYv3A52jTMAgqppUxEJpm6CuUKNYLYgHEem2oFEft7UL7FblrHT4IuxzNNs/vhqu+R52drQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEtjs1WiyRQizt2jBspRQGGZ11CxjqjWAPk+GLwePAdX4MHjbL
	8P4LMfxbY5LAZNDc6oIPPUjnq0E3KwgpLziT+V95eZfHyLwC+CR2+Alvoy6jhwZrNq5DJIkZ/V/
	54jFDBMBU41rzmAg1wCumKu+qrFoyhZaMO2iw7/LRfmUryVbAPBteIOLJvn3VYtepROgmDiOlvW
	fBn2NFOdPxx90StrRYSKja9Hnfhxcr7uuRkzv7q+aQ/7w=
X-Gm-Gg: ASbGncunUrVgCywsM/SiK1I3OjM6FWLNJzmi8EZ0n1YUAm5qulgvGPt7Dbz7QElVOgh
	3xdbYffUkPI6+q/yTSQWSWiQZRhqvdOb979zpLmjMWo5Ggomwoer1XaRh3YusvVb0Bc+9PjWgO0
	PKDjcf
X-Received: by 2002:a17:90b:2590:b0:313:20d2:c99b with SMTP id 98e67ed59e1d1-3159d647127mr19096907a91.9.1750665721081;
        Mon, 23 Jun 2025 01:02:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwvJmitMFzVsCxQacD9wJZkZUj97HiH7s1k1+55IzJYBpEPn6G3l1MT8f7owON0ggsIupxoZStFW5LX89ubtA=
X-Received: by 2002:a17:90b:2590:b0:313:20d2:c99b with SMTP id
 98e67ed59e1d1-3159d647127mr19096860a91.9.1750665720519; Mon, 23 Jun 2025
 01:02:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACGkMEseO0Y2jTYNswvdcr9ihN9ZN7s-TXGMNdLyHwRyNFys2g@mail.gmail.com>
 <20250619024227.1423598-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250619024227.1423598-1-niuxuewei.nxw@antgroup.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 23 Jun 2025 16:01:49 +0800
X-Gm-Features: AX0GCFu9ZwrKQetSSkOwS2HCrVtUVvp2XfA94hVvDQOVZR6OKnQNIuZyeplONl4
Message-ID: <CACGkMEsjNw3ELRxf4aZ3=Zh=EsqbTpqKp61C8mVjd_zEAOuW1w@mail.gmail.com>
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, sgarzare@redhat.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RrbEhG47H4Bj0_w_RdmfXUzw4epwDTLA_5c5BwZVqIM_1750665721
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 10:42=E2=80=AFAM Xuewei Niu <niuxuewei97@gmail.com>=
 wrote:
>
> > On Wed, Jun 18, 2025 at 5:51=E2=80=AFPM Xuewei Niu <niuxuewei97@gmail.c=
om> wrote:
> > >
> > > > On Wed, Jun 18, 2025 at 1:40=E2=80=AFPM Xuewei Niu <niuxuewei97@gma=
il.com> wrote:
> > > > >
> > > > > > On Wed, Jun 18, 2025 at 10:47=E2=80=AFAM Xuewei Niu <niuxuewei9=
7@gmail.com> wrote:
> > > > > > >
> > > > > > > > On Tue, Jun 17, 2025 at 3:46=E2=80=AFPM Xuewei Niu <niuxuew=
ei97@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > Resend, because it isn=E2=80=99t listed in the mailing li=
st due to my mistake.
> > > > > > > > >
> > > > > > > > > > On Mon, Jun 16, 2025 at 4:38=E2=80=AFPM Stefano Garzare=
lla <sgarzare@redhat.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Mon, 16 Jun 2025 at 10:29, Xuewei Niu <niuxuewei97=
@gmail.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > > On Fri, Jun 13, 2025 at 4:46=E2=80=AFPM Xuewei Ni=
u <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niu=
xuewei97@gmail.com> wrote:
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > On Sat, Apr 12, 2025 at 10:39=E2=80=AFPM =
Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > This patch brings a new feature, called=
 "multi devices", to the virtio
> > > > > > > > > > > > > > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_=
MULTI_DEVICES" feature bit, and a
> > > > > > > > > > > > > > > > > > "device_order" field to the config for =
the virtio vsock.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > =3D=3D Motivition =3D=3D
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Vsock is a lightweight and widely used =
data exchange mechanism between host
> > > > > > > > > > > > > > > > > > and guest. Currently, the virtio-vsock =
only supports one device, resulting
> > > > > > > > > > > > > > > > > > in the inability to enable more than on=
e backend.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > I wonder which part of the spec forbids m=
ore than one device.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > No. The spec, however, is designed for a si=
ngle device, and lacks some
> > > > > > > > > > > > > > > > specifications for multiple devices.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > For example, we should have a mechanism to =
select a device from all to
> > > > > > > > > > > > > > > > communicate with a peer.
> > > > > > > > > > > > >
> > > > > > > > > > > > > I wonder if this is a:
> > > > > > > > > > > > >
> > > > > > > > > > > > > 1) mechanism that needs to be mandated by the dev=
ice
> > > > > > > > > > > >
> > > > > > > > > > > > Yes.
> > > > > > > > > > > >
> > > > > > > > > > > > > 2) a policy that is allowed to be tweaked by the =
user as TCP/IP did
> > > > > > > > > > > >
> > > > > > > > > > > > Not allowed in the current version.
> > > > > > > > > > > >
> > > > > > > > > > > > > (Note anyhow the driver can override what the dev=
ice suggests...)
> > > > > > > > > > >
> > > > > > > > > > > I think we should follow what we described in the spe=
c:
> > > > > > > > > > > "The virtio socket device is a zero-configuration soc=
ket communications device."
> > > > > > > > > >
> > > > > > > > > > We probably need to define "configuration" first.
> > > > > > > > > >
> > > > > > > > > > For example, if it means zero configuration from the us=
er, it does not
> > > > > > > > > > conflict with 2), the driver can use its own algorithm =
to elect a
> > > > > > > > > > "default" device.
> > > > > > > > >
> > > > > > > > > IMHO, it can be done, but it is not the current design.
> > > > > > > >
> > > > > > > > Well, you need at least explain the advantages or why you c=
hoose to do this.
> > > > > > >
> > > > > > > I listed in the previous message. Maybe it is not clear enoug=
h. I'll try to
> > > > > > > explain it again.
> > > > > > >
> > > > > > > I think people should pick up the device by a `bind()` call, =
which takes a
> > > > > > > CID as an argument.
> > > > > > >
> > > > > > > Generally, the device is picked up by the source CID, which i=
s achieved
> > > > > > > through a `bind()` call.
> > > > > > >
> > > > > > > The default device, which is equivalent to the current single=
 device, is
> > > > > > > used to be compatible with the existing applications.
> > > > > > >
> > > > > > > Apart from that, the default device is used to communicate wi=
th hypervisor
> > > > > > > for some init works, such as gathering information about othe=
r vsock
> > > > > > > devices.
> > > > > > >
> > > > > > > To summarize, users must do `bind()` call explicitly to selec=
t the desired
> > > > > > > device for non-HV-VM communications.
> > > > > >
> > > > > > So if I understand correctly you need a way to select the defau=
lt when
> > > > > > bind() is not called?
> > > > >
> > > > > Yes.
> > > > >
> > > > > > > > > I prefer to set the default device for VM-HV communicatio=
n to do some init
> > > > > > > > > work. I don't think people have a strong need for this.
> > > > > > > > >
> > > > > > > > > > Another perspective, making decisions in guests may be =
even more
> > > > > > > > > > helpful for the case where the device is not trusted
> > > > > > > > >
> > > > > > > > > How does the guest realize the vsock device is not truste=
d?
> > > > > > > >
> > > > > > > > There're various ways to build trust (for example device at=
testation)
> > > > > > > > and more might come in the future.
> > > > > > > >
> > > > > > > > > The guest only
> > > > > > > > > knows the information from its config space, which is pro=
vided by the host.
> > > > > > > >
> > > > > > > > The way to build trust is probably beyond the scope of virt=
io, but it
> > > > > > > > is something we need to consider.
> > > > > > >
> > > > > > > Agree with you. If it comes in the future, I think the driver=
 should have
> > > > > > > the ability to make decisions.
> > > > > >
> > > > > >
> > > > > > Actually, I meant the way to build trust via virtio is somethin=
g that
> > > > > > needs to be considered. But now we have other ways to build tru=
st.
> > > > > > That would result a situlation:
> > > > > >
> > > > > > 1) "default" vsock device is not trusted but other might
> > > > >
> > > > > I think this topic might be beyond the scope of this patch.
> > > > >
> > > > > With the current version, there is only one device supported, whi=
ch can be
> > > > > considered as the "default".  We don't have a mechanism to say "w=
e don't
> > > > > trust you", right?
> > > >
> > > > No. I meant we don't have it in the virtio core but we already have=
 it
> > > > in other layers (for example the transport layer).
> > >
> > > Are you referring to virito-vsock transport layer?
> >
> > Yes, for example the PCI layer.
> >
> > >
> > > > > That is, it is assumed that we trust the device provided
> > > > > by the hypervisor.
> > > > >
> > > > > This patch is for multiple devices support, based on the same ass=
umption. I
> > > > > think trust is a good point to consider, but perhaps we have to a=
ddress it
> > > > > in the follow-up patches.
> > > >
> > > > My point is not about how to build trust, it's about letting the
> > > > driver decide by itself in some cases.
> > > >
> > > > A better way might be something like:
> > > >
> > > > "The device_order is a hint for the driver to select a default vsoc=
k
> > > > device. Device MAY choose ...."
> > >
> > > Okay, I'll do that.
> > >
> > > > >
> > > > > > or
> > > > > >
> > > > > > 2) two device claims that they are all "default"
> > > > > >
> > > > > > This means anyhow we need a decision from the driver side so th=
e
> > > > > > device side order seems to be useless here.
> > > > >
> > > > > There is only one default device. The device with the lowest devi=
ce_order
> > > > > is considered the default. It is not allowed to have the same dev=
ice_order.
> > > >
> > > > Who can forbid two same device_order? Note that in various security
> > > > models, hypervisors are not trusted at all.
> > >
> > > The driver does. Indeed, the driver is able to deny devices if they v=
iolate
> > > the spec.
> >
> > Yes, that's the point, anyhow driver need to do the decision.
> >
> > >
> > > > > > > > > > > So, IMO the guest (driver) should not be allowed to c=
hange anything.
> > > > > > > > > > > E.g. Right now it's not allowed to change the CID ass=
igned by the host (device).
> > > > > > > > > >
> > > > > > > > > > A dumb question when having two cids (cid1 and cid2) in=
 the same
> > > > > > > > > > guest, what happens if src=3Dcid1 and dst=3Dcid2?
> > > > > > > > >
> > > > > > > > > The packets will be directed to another application, if a=
ny, on the same guest.
> > > > > > > >
> > > > > > > > Ok, so in your example, vhost-user-vsock should route those=
 packets
> > > > > > > > back to kernel vsock?
> > > > > > >
> > > > > > > It depends. Two cases are possible:
> > > > > > >
> > > > > > > 1. dev0(cid1) and dev1(cid2) are from the same type of backen=
d, e.g.
> > > > > > > vhost-vsock, so the packets will be routed back as you descri=
bed.
> > > > > > > 2. dev0(cid1) from vhost-user-vsock, and dev1(cid2) from vhos=
t-vsock, the
> > > > > > > packets will be dropped if vhost-user-vsock device can't find=
 a device
> > > > > > > whose cid is cid2.
> > > > > >
> > > > > > Well, this means the behavior depends on the implementation whi=
ch is not good.
> > > > >
> > > > > No, it is not. It depends on whether the device can find a proper
> > > > > target device based on the dst_cid.
> > > >
> > > > This sounds really weird, two cids belong to the same guest. So gue=
sts
> > > > should expect that the two vsock devic can talk to each other?
> > >
> > > Yes, a little bit complicated.
> > >
> > > Two constraints should be applied:
> > >
> > > 1. No CID conflicts within the driver;
> > > 2. No CID conflicts within the address space.
> > >
> > > Here is a diagram to illustrate the situation where it does not viola=
te the
> > > constraints:
> > >
> > >  =E2=94=8C=E2=94=80 kernel=E2=94=80(as0)=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> > >  =E2=94=82   =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90            =
          =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90  =E2=94=8C=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=90=E2=94=82
> > >  =E2=94=82   =E2=94=82 dev0(cid0)=E2=94=82                      =E2=
=94=82 dev2(cid1)=E2=94=82  =E2=94=82 dev3(cid2)=E2=94=82=E2=94=82
> > >  =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98            =
          =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98  =E2=94=94=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=
=94=80=E2=94=80=E2=94=98=E2=94=82
> > >  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=
=80=E2=94=80=E2=94=98
> > >   =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90   =
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> > >   =E2=94=82      =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=90        =E2=94=82   =E2=94=82      =E2=94=82  =E2=94=8C=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90    =E2=94=82   =E2=94=82
> > >   =E2=94=82      =E2=94=94=E2=94=80=E2=94=80=E2=96=BA dev0(cid0)=E2=
=94=82        =E2=94=82   =E2=94=82      =E2=94=94=E2=94=80=E2=94=80=E2=96=
=BA dev2(cid1)=E2=94=82    =E2=94=82   =E2=94=82
> > >   =E2=94=82         =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98      =
  =E2=94=82   =E2=94=82         =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98=
    =E2=94=82   =E2=94=82
> > >   =E2=94=82         =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90      =
  =E2=94=82   =E2=94=82         =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90=
    =E2=94=82   =E2=94=82
> > >   =E2=94=82      =E2=94=8C=E2=94=80=E2=94=80=E2=96=BA dev1(cid1)=E2=
=94=82        =E2=94=82   =E2=94=82         =E2=94=82 dev3(cid2)=E2=97=84=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98   =E2=94=82
> > >   =E2=94=82      =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=98     VM0=E2=94=82   =E2=94=82         =E2=94=94=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=98     VM1=E2=94=82
> > >   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98   =
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
> > >    vhost-user-vsock
> > > =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=90
> > > =E2=94=82   =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90               =
                                    =E2=94=82
> > > =E2=94=82   =E2=94=82 dev1(cid1)=E2=94=82                            =
                       =E2=94=82
> > > =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98               =
                                    =E2=94=82
> > > =E2=94=94=E2=94=80userapp=E2=94=80(as1)=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=98
> > >
> > > - VM0
> > >     - dev0
> > >         - dst_cid =3D 2 (well-known cid): connect to host;
> > >         - dst_cid =3D cid1: connect to dev2 (they are in the same as0=
);
> > >         - dst_cid =3D cid2: connect to dev3;
> > >     - dev1
> > >         - dst_cid =3D 2 (well-known cid): connect to userapp;
> > >         - dst_cid =3D cid0: failure (no cid0 is available in as1, eve=
n though
> > >         cid1 is available in the VM0);
> > >         - dst_cid =3D cid1: connect to dev0;
> > > - VM1
> > >     - dev2
> > >         - dst_cid =3D 2 (well-known cid): connect to host;
> > >         - dst_cid =3D cid0: connect to dev0;
> > >         - dst_cid =3D cid2: connect to dev3;
> > >     - dev3: skip the same as dev2.
> > >
> > > So back to your question, my answer is that it depends on the address
> > > space. Hope it could be helpful.
> >
> > This brings an interesting question, for example if vm0 tries to
> > connect to vm1, how does it know which device it needs to use (lacking
> > the concept like switch/route/address announcing etc...)?
>
> The HV should maintain a table for that. The guest things firstly
> communicate with the HV, through the default device, to know which device
> to use.

It's still not clear to me how things work. For example, we had a
guest1 with two cid 4 ("default"),5 another guest2 with one cid 6. You
meant guest1 needs to ask the host to know about which device is
connected to 6? Or actually any device in guest1 can be used to
connected to guest2?

Thanks

>
> Thanks,
> Xuewei
>

