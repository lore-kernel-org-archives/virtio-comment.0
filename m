Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051CB2EACF9
	for <virtio-comment@lists.linux.dev>; Mon, 10 Aug 2026 02:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786327773; cv=none; b=IPLUO28XbK/Hz1Drvm3rsglbbySLm369Y0oCNTLuBr6qWCa/IOYBc+/CTGw4EF2MyfX88mbl9a0g/gPQQvoJ5aU3dNicHOmwVVUprHWRq7Pfk+mi9jYW6W4LckH+wyrh3pdMHbTOJLXqPQ3sX/1S4pA/nuSQaNQk1EaANBkaNG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786327773; c=relaxed/simple;
	bh=7ZiQibCRYuZKcZ+PiaRKTAOH+Yl6wg94aO2JdoZuXJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lo6WUPmq89kimlivg6CeijpfwttzO/ra5A9OfHfPcUu4WZI+aTnX3R91L8++CBaKgFHGVFGhn0IWCdAkoqgScSpPrFjWSrVUSywSv9qaSbuLuKI4BJ1fwYoJyc06+u/AECSx26VdlonlezYCEgBx7Fyt9b/RK+N9N/erPg/6Duk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9BE3/fV; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9BE3/fV"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7ff05e5d009so15067067b3.1
        for <virtio-comment@lists.linux.dev>; Sun, 09 Aug 2026 19:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786327771; x=1786932571; darn=lists.linux.dev;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kJclqBrGo4nHx9PfJZf3hkyq+0lZdBl9GcRh6vNg+vg=;
        b=m9BE3/fV7siheIWbi3h6z7bV1/BU3JzZ8iGXmAgcOKX6bwxsLLMgkjhG4ZApdN+IVO
         x9JPjoHNCu7vlRvnZegAMpULYLrJuhWZHBz0zCoG4cZamVVhDiptimnrImqA03xJxrik
         Avf7JdF2BJVNSYIThjMsL0VnUHg3deyjuhLgFByLU2n2DfYiDL5mviazuckvH2E3R7cO
         vJXeSelbuZ+S/ne7g455V9hRRR5DmAJe/+PXHYZBuAXdgx8fDIC08PmQX5GyX+8GJWv0
         FkpyaHcvGEKkvk33MtPfHeDzN8Y7GfaysMBeySgICdiq5EmfHlxIwlrodUdWxafs02rZ
         ziLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786327771; x=1786932571;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJclqBrGo4nHx9PfJZf3hkyq+0lZdBl9GcRh6vNg+vg=;
        b=kG4DBUO6qRWbOJVHnvtP6zij9LbzPyIxu07CsDMaEkJZR0IbSbfs5P1oiSSW7ZzHSD
         uqKpSsY8veT2F0C34kGLvhs+RuNP8bX9TXTax+Gb7vJp1uuWoeMVv93PfevGcgnc/4zb
         4Iq0NlYZ5Nb/2jsq2tK9+fBRLs6v8uIt2BpicfkH7l9ZIl/WWRO1RG/JqSqRunHF3D4+
         d3XZAcGyQaXaRoUHaLFqQbJlgvCc45Dfn9zGGNjchWM3ymJXusY/9XMcj4JjQoQJIceF
         Sa+vViKthEnHwRqoL/NDBsaOi6XqSiHaKJYz6NRnGNA3XaoqlcjYCGg3xhGt9sPMQ7mi
         RbwQ==
X-Gm-Message-State: AOJu0YyOBY9wvgPtue9y0GUHMiw3dTIXZsHzw5YBNdYGqCOYFLrV4ooa
	HBowFArsNa1gWd64rX04t8WNvTMJZVRk0CiG48cwBcMwdahkdCJAvfm+
X-Gm-Gg: AR+sD11jc48OddmWymgez7NjL8E7oIALA5I/w4oFCBU0p84CYqfOvAxDkLI2oPti9fy
	556x3gqiJPeqwpV2b5ZOqNKeYBt2aPsM93kmM4idJUdYTotnk3q72c+Ur7WD1YPpf1sDHaWh1NA
	8OSqEc6quKpaG1yRhuuvbR6QxatTrs2BdNRjVO0/P0Nbn5+pnmnMKcMXm7wqi5WpMsOLyEqccmv
	mIhhY9jLtnS4mI0Wim8ikoDgriTABbsIx5QvpAZIzyZBgbj9PILWue8LkW3eB0jVqzkAwcroebX
	VM0RQjDccd0Wi6CHZr4MZ3cELvHoh3NnBVfcwp0Mz3vUGLU0pJl5Pr/9VQy1tKnKhLJK3VX7hJz
	+J7myEP+CAn07n7tu8Y5QbhIdktl1UWgZY748lc6Jog4Lr9isIyqcTTBxliZ5AZYFwp60UmG/4l
	KUNoEYEoRdijD7VWeLMIp2Al4YjSc+tJhkP8UmIPqNnSUhUoyfTlT3l/pIlIX8HM4=
X-Received: by 2002:a05:690c:630d:b0:81f:27f8:2de4 with SMTP id 00721157ae682-820222b1f41mr232594757b3.8.1786327770630;
        Sun, 09 Aug 2026 19:09:30 -0700 (PDT)
Received: from [10.138.10.6] ([185.98.168.14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f604e939sm48451367b3.33.2026.08.09.19.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 19:09:29 -0700 (PDT)
Message-ID: <8c7365fe-8ae8-484f-9da5-34f06cbd2385@gmail.com>
Date: Sun, 9 Aug 2026 22:09:15 -0400
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Add VIRTIO_F_DMB (Device Memory Buffer)
To: "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <graf@amazon.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowangio@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20260716215426.46037-1-graf@amazon.com>
 <20260804161202.38619-1-graf@amazon.com>
 <20260809113831-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260809113831-mutt-send-email-mst@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pcIqBj4mNCpBsHXBflNKCSzY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pcIqBj4mNCpBsHXBflNKCSzY
Content-Type: multipart/mixed; boundary="------------dD3xDilL5MZFF3l09vs0HO7V";
 protected-headers="v1"; hp="clear"
Message-ID: <8c7365fe-8ae8-484f-9da5-34f06cbd2385@gmail.com>
Date: Sun, 9 Aug 2026 22:09:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Add VIRTIO_F_DMB (Device Memory Buffer)
To: "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <graf@amazon.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowangio@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20260716215426.46037-1-graf@amazon.com>
 <20260804161202.38619-1-graf@amazon.com>
 <20260809113831-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20260809113831-mutt-send-email-mst@kernel.org>

--------------dD3xDilL5MZFF3l09vs0HO7V
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 8/9/26 17:48, Michael S. Tsirkin wrote:
> On Tue, Aug 04, 2026 at 04:12:02PM +0000, Alexander Graf wrote:
>> When a transport uses a shared bounce region for virtqueue memory toda=
y,
>> that region is global and shared by multiple devices at once. Devices
>> then contend over one small region, so a busy device can starve the
>> others, and one device's emulation cannot be isolated or torn down on =
its
>> own because its state lives in memory everyone else is using too.
>>
>> VIRTIO_F_DMB gives each device its own shared memory region, the Devic=
e
>> Memory Buffer, that holds that device's virtqueues (Descriptor, Driver=

>> and Device Areas) and the buffers the descriptors reference. When the
>> feature is negotiated, every address the driver places in a virtqueue =
is
>> an offset into that region rather than a physical or bus address, so t=
he
>> device only ever touches memory the driver placed there. Because each
>> device owns its region, its emulation can run in a separate host proce=
ss
>> and be terminated independently, and devices no longer contend over on=
e
>> shared region.
>>
>> The device reports the region's shmid through a transport-specific
>> mechanism (dmb_shm_id in the PCI common configuration structure, DMBSH=
MId
>> on MMIO), so the shmid does not collide with device-specific or future=

>> transport-specific shared memory regions. The driver locates the regio=
n
>> through the existing Shared Memory Regions facility. VIRTIO_F_DMB refi=
nes
>> VIRTIO_F_ACCESS_PLATFORM and is negotiated only together with it.
>>
>> To provide the confinement guarantee, the device bounds-checks every
>> driver-supplied offset against the region and sets DEVICE_NEEDS_RESET =
on
>> violation.
>>
>> The general requirement on shared memory regions forbids a device to
>> expose a region used to control its operation or to stream data, and a=

>> Device Memory Buffer is used for both, so it is named as that
>> requirement's exception.
>>
>> The Device Memory Buffer is memory the driver shares with the device o=
n
>> platforms that distinguish shared from private mappings, and the devic=
e
>> provides coherency without cache maintenance by the driver. A device
>> that requires the platform's barriers offers VIRTIO_F_ORDER_PLATFORM,
>> and a driver accepts VIRTIO_F_DMB only together with it. Offset 0 in
>> the region is reserved: a device that predates the feature reads a
>> Descriptor Area address of 0 as a queue that is not in use, as the
>> legacy QueuePFN register states.
>>
>> Signed-off-by: Alexander Graf <graf@amazon.com>
>> ---
>>
>> Link: https://lore.kernel.org/virtio-comment/20260702040006.65669-1-gr=
af@amazon.com/ [v1]
>> Link: https://lore.kernel.org/virtio-comment/20260716215426.46037-1-gr=
af@amazon.com/ [v2]
>>
>> v1 -> v2:
>>  - Replace the fixed reserved shmid 2 and its registry with a shmid th=
e
>>    device reports per transport, as Stefan Hajnoczi suggested on v1.
>>  - Spell out per-transport compatibility for dmb_shm_id and DMBSHMId.
>>  - Set FAILED when the driver cannot find the region, rather than refu=
se
>>    to negotiate.
>>  - List VIRTIO_F_DMB under CCW's features reserved for future use.
>>
>> v2 -> v3:
>>  - Require the region to be memory the driver shares with the device.
>>  - Require coherency; couple VIRTIO_F_DMB to VIRTIO_F_ORDER_PLATFORM,
>>    replacing v2's sentence on the areas' interaction with it.
>>  - Reserve offset 0 in the region.
>>  - Except the Device Memory Buffer from the shared-region prohibition.=

>>  - Allow a device to expose further shared memory regions.
>>  - Move bit 44 into the queue and feature negotiation reserved list.
>>  - Aim two cross-references at the Reserved Feature Bits chapter.
>>
>>
>>  conformance.tex    |   2 +
>>  content.tex        |  28 ++++++-
>>  shared-mem.tex     | 199 ++++++++++++++++++++++++++++++++++++++++++++=
-
>>  transport-ccw.tex  |   1 +
>>  transport-mmio.tex |  15 ++++
>>  transport-pci.tex  |  20 +++++
>>  6 files changed, 262 insertions(+), 3 deletions(-)
>>
>> diff --git a/conformance.tex b/conformance.tex
>> index 9af31e2..cf4259d 100644
>> --- a/conformance.tex
>> +++ b/conformance.tex
>> @@ -104,6 +104,7 @@ \section{Conformance Targets}\label{sec:Conformanc=
e / Conformance Targets}
>>  \item \ref{drivernormative:General Initialization And Device Operatio=
n / Device Initialization}
>>  \item \ref{drivernormative:General Initialization And Device Operatio=
n / Device Cleanup}
>>  \item \ref{drivernormative:Reserved Feature Bits}
>> +\item \ref{drivernormative:Basic Facilities of a Virtio Device / Shar=
ed Memory Regions / Device Memory Buffer}
>>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Devi=
ce groups / Group administration commands / Device and driver capabilitie=
s}
>>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Devi=
ce groups / Group administration commands / Device resource objects}
>>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Devi=
ce groups / Group administration commands / Device parts}
>> @@ -191,6 +192,7 @@ \section{Conformance Targets}\label{sec:Conformanc=
e / Conformance Targets}
>>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Pack=
ed Virtqueues / The Virtqueue Descriptor Table}
>>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Pack=
ed Virtqueues / Scatter-Gather Support}
>>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Shar=
ed Memory Regions}
>> +\item \ref{devicenormative:Basic Facilities of a Virtio Device / Shar=
ed Memory Regions / Device Memory Buffer}
>>  \item \ref{devicenormative:Reserved Feature Bits}
>>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Devi=
ce groups / Group administration commands / Device and driver capabilitie=
s}
>>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Devi=
ce groups / Group administration commands / Device resource objects}
>> diff --git a/content.tex b/content.tex
>> index 243ce2d..8c5a844 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -102,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilitie=
s of a Virtio Device / Feature B
>>  \begin{description}
>>  \item[0 to 23, 41, 42 and 50 to 127] Feature bits for the specific de=
vice type
>> =20
>> -\item[24 to 40, and 43] Feature bits reserved for extensions to the q=
ueue and
>> +\item[24 to 40, 43 and 44] Feature bits reserved for extensions to th=
e queue and
>>    feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}=

>> =20
>> -\item[44 to 49, and 128 and above] Feature bits reserved for future e=
xtensions.
>> +\item[45 to 49, and 128 and above] Feature bits reserved for future e=
xtensions.
>>  \end{description}
>> =20
>>  \begin{note}
>> @@ -946,6 +946,15 @@ \chapter{Reserved Feature Bits}\label{sec:Reserve=
d Feature Bits}
>>     suspend the device by set the SUSPEND bit to 1.
>>     See \ref{sec:Basic Facilities of a Virtio Device / Device Status F=
ield}.
>> =20
>> +  \item[VIRTIO_F_DMB(44)] This feature indicates that the device offe=
rs a
>> +  Device Memory Buffer: a shared memory region, owned by the device,
>> +  that holds the virtqueues and the buffers they reference.  When thi=
s feature
>> +  is negotiated, every address that the driver places in a virtqueue =
is an
>> +  offset into the Device Memory Buffer region rather than a physical =
address
>> +  or a bus address.  The device is thereby confined to memory the dri=
ver has
>> +  published in that region.
>> +  See \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Re=
gions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio D=
evice / Shared Memory Regions / Device Memory Buffer}.
>> +
>>  \end{description}
>> =20
>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bi=
ts}
>> @@ -982,6 +991,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserve=
d Feature Bits}
>> =20
>>  A driver SHOULD accept VIRTIO_F_NOTIF_CONFIG_DATA if it is offered.
>> =20
>> +A driver MUST NOT accept VIRTIO_F_DMB unless it also accepts
>> +VIRTIO_F_ACCESS_PLATFORM.  If VIRTIO_F_ORDER_PLATFORM is offered, a d=
river
>> +MUST NOT accept VIRTIO_F_DMB unless it also accepts VIRTIO_F_ORDER_PL=
ATFORM.
>=20
> Why is that? access platform is for DMA from device of which
> there's none here. Both it and order platform are useful to disable
> to speed up software configs.

I agree: combining VIRTIO_F_DMB and VIRTIO_F_ACCESS_PLATFORM shouldn't
be combined.  I'd treat the combination as an error.

>> +For the driver requirements that apply once VIRTIO_F_DMB has been
>> +negotiated, see
>> +\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions =
/ Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device =
/ Shared Memory Regions / Device Memory Buffer}.
>> +
>>  \devicenormative{\section}{Reserved Feature Bits}{Reserved Feature Bi=
ts}
>> =20
>>  A device MUST offer VIRTIO_F_VERSION_1.  A device MAY fail to operate=
 further
>> @@ -1011,6 +1027,14 @@ \chapter{Reserved Feature Bits}\label{sec:Reser=
ved Feature Bits}
>>  and presents a PCI SR-IOV capability structure, otherwise
>>  it MUST NOT offer VIRTIO_F_SR_IOV.
>> =20
>> +A device that offers VIRTIO_F_DMB MUST also offer VIRTIO_F_ACCESS_PLA=
TFORM.
>> +A device that offers VIRTIO_F_DMB MUST also offer VIRTIO_F_ORDER_PLAT=
FORM if
>> +the device requires the driver to use memory barriers suitable for de=
vices
>> +described by the platform when accessing the Device Memory Buffer reg=
ion.
>=20
> This is really vague. On most platforms drivers can map
> in any way they want. What is expected here? What barriers to
> use will very much depend on that.
>=20
> In particular, how do you expect this mapped? If cached what forces
> the data out of the CPU cache?

My understanding is that VIRTIO_F_DMB is only a good choice for
untrusted devices implemented in software.  Both the original use-case
(protected VMs on Android) and my use-case (Spectrum VMs using untrusted
virtio-vhost-user devices) fall into this category.  In this case,
the DMB is just ordinary RAM, so VIRTIO_F_ORDER_PLATFORM isn't needed.

On the other hand, hardware devices shouldn't implement VIRTIO_F_DMB.
This would require the CPU to read data over PCIe, which is slow.
Instead, the driver should use a bounce buffer in system RAM, which
provides the same level of security (assuming hardware DMA protection
of some sort).

I'd be fine with making VIRTIO_F_DMB and VIRTIO_F_ORDER_PLATFORM
mutually exclusive.  Forbid devices from offering both, and require
drivers to refuse to use a device that does.  Reconsider once a
sensible use-case appears.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------dD3xDilL5MZFF3l09vs0HO7V--

--------------pcIqBj4mNCpBsHXBflNKCSzY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmp5MtUACgkQszaHOrMp
8lMq9w/+NCltT5v3q7yRJePBc6VXgL4v0dGascR07se7IPWqoj8H/99CUmtG0OFB
y4hhtJREnt1osARG4KEMLTne08LDya7Igh7fLWLIQ+8D1uWNij36uPkcZeWVfVHt
scIaDbdMiUgfqDnZQSfauymv+Ri95asibsIU/ZblQjnbkS67GFesOtP4f9jIQG2/
xjmeVxW8C+x5+5cXGdTsmRWpTZwQNKow02POI3XqGP+g2cFZzoembBmxJ3IFfx3z
UGUrriNSdmKoURocvRIg5Bn4OGApM818bVGl648cbHdl4BdrqIUjeiiF02tIETBG
PHnX/EEiZweHU5x+jz24KJWbCR/s6jAQQPrMO2wu9ZpR+tKdzEkVmrJcQ/G/wm3h
rpyqFBO5aIU2XdeqjKjO8Qb2ggCsaAz86VrvxmCQ2AecuEz7166caUU9htUE9iUG
xNzHpsv8K+RQio6O8BPXbxd4l32GUvfoKUtOkap/ebdNbKNMCJzJ1viEgf0Isq9Y
GCcjHRqmyheXULQbnNAnh9FaPvWCaBi8e0iTZ9QlnfhLbNTKcXfoVWQfBELjudb1
bhod1n3I/3oGPEzGDRtmWiPxcgNXDeYLawGJWaJj2HgTZyOrREbV8jkSB+itFUWp
mZl5qNBU/0DOgQo1F/SaF3EvARwQbqtxzWBYKI6sBPttiDJfKj4=
=beMl
-----END PGP SIGNATURE-----

--------------pcIqBj4mNCpBsHXBflNKCSzY--
