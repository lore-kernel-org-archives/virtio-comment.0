Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549972309AA
	for <virtio-comment@lists.linux.dev>; Tue, 26 May 2026 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799898; cv=none; b=VFefUCPc/H2AuAaFxjJ8ToZV4rq81LqzzZD2bQqxIk/zuYtwd9+IS3nGVeVnDPGoou8gKOQcXcN3QvXcyMz2XHH/j6sL6+oXz3SH0BzyZ67Phy5jWibb6+PjiHreCfbtDxqVy5uiLUnm3/Eb1mAjnGHvA/wCDnD0hsmUQmOgX7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799898; c=relaxed/simple;
	bh=UfxEizyRmcYTTQqqDCszFOln1motBijVDSWED0UAy3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kGZnCuVKv/lwHgW9ANm+jTyn500qqjjLMqeFuAa0Xx/U24WLDM3mb7EjiLUoZWx8fCnuGbPvJBDmcUjyYB/YOh2kKnWw7W4vwpKLqigOaFlFkYZtmdq+jVSMNFbZtvBffuRnZWELOHEzvWBrmVNdU8OTIvVNxPKJyiVidKD6kh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OYegP5zM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OYegP5zM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779799896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qGwvOBtFUSXRCyq1DMX6aNEmLel7X07pUag0lKs0yfU=;
	b=OYegP5zMFZHUv0lxYStxe7qKPwBt1ji4A8TCYhniXbjL/1zPWeJKW1kKl6hZNrE9yO1O33
	VKHmNimgTUFLWyvc/SNf7LvlvCAHstwwE6831PPqpgyNz8JduD3ikMedqxo7/dyLFSiNw1
	GLwH04cuOJjSPRIxsDLMgl3lmJofCpk=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-VPtuMUf5P_SuQ3Ko6sNmeg-1; Tue, 26 May 2026 08:51:34 -0400
X-MC-Unique: VPtuMUf5P_SuQ3Ko6sNmeg-1
X-Mimecast-MFC-AGG-ID: VPtuMUf5P_SuQ3Ko6sNmeg_1779799894
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba5f794825so83158895ad.0
        for <virtio-comment@lists.linux.dev>; Tue, 26 May 2026 05:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799893; x=1780404693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGwvOBtFUSXRCyq1DMX6aNEmLel7X07pUag0lKs0yfU=;
        b=py4VRaEJ1LtadOyPq170n1+iG2LU2K0+X3NNm4HW4yoBcaVcMfLmb8M3AEnUfZZy6e
         FDci+/ovEyoRr3uyfCtXOyyglWAZM+dfaEyWQ3fyHlxyXxBzC/C5hZ/KrJN293FlXe9o
         ZzOq7qo+SH/fPEcQf29HK00KqORy+TiSeTzWFSf40vja7ISoYHcXv9YBx+f8AqQj0ZB+
         XX145Twcl8yh1DD8HcFP7WDIHTT4dh0Ops8kdPmvhBuQQOw+lV1Jr1eXDx7OJCw2kJOd
         kbPb9AiNGnA3G1JfV+lJJEQmBU0WXRa1cfEKExAREoxgpxnpkm2axa7wBTOvAviBnzGi
         f+HQ==
X-Gm-Message-State: AOJu0YyE+H9OK3lwIXRV1kLEAJjbUXGEUQ2R2hjHfqJiemt7htn5oUeF
	C3SNrkcITAZi8y2U6hkrLWRbhYlTDghxxUqdNnYsYwEjUTvrQ+lorJFG/REc+dvl/gJwLTKbwZS
	mK2xLiU8X/DmIjxrTEH2bVtcdYz0sqAQEN8olSd3R2dIXto+ia9cBF3XQQz9wK1tEPng1/lzenE
	2ostpZADlSSDU/QT5bfV3yOHWUqs2lWTIYYrkt7imU8caNDOH6BWmqPw==
X-Gm-Gg: Acq92OGgBkzS8joHpg1kJ6kAgZgNbHdSchY2U+tMjquovwpyNWlLQARC5kb5q4qtCV0
	L15b8Ae4U8YZRijJxZDykWp/8l7t0WAOiJxGFfAX6fbk5RTflZTpWTbR20IrNFbxVx/MBChC26a
	hgDFwmU49pvM6MLLM1F13bSPJEbBMjOTZ/MdZybMxejcgFq+D2ESBNMi5wT670wSJSCaqqG02uj
	Bs8nTn3EXT53WB2sGbXHGYbBWDMU30cRaBIUoRl/XY2L56TuchZWEyAFA8ZRGzk6EPhLUuBZZ1j
	XhiwD9K9gs5Px6l94wlz6M4=
X-Received: by 2002:a05:6a20:12c2:b0:3b3:10e1:a869 with SMTP id adf61e73a8af0-3b328fc45e3mr19238507637.50.1779799893556;
        Tue, 26 May 2026 05:51:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:12c2:b0:3b3:10e1:a869 with SMTP id
 adf61e73a8af0-3b328fc45e3mr19238482637.50.1779799893041; Tue, 26 May 2026
 05:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415145435.2023866-1-marcandre.lureau@redhat.com>
 <9452396c-e1be-43da-83f7-f4ea4fb997ec@kernel.org> <CAMxuvazkD6csS1yUd2=oVQhm7-CCU3P4wkCzV7aJPq_fUKUqRg@mail.gmail.com>
 <bc5cb24c-8510-464f-8e5f-738aef14c9bf@kernel.org>
In-Reply-To: <bc5cb24c-8510-464f-8e5f-738aef14c9bf@kernel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 26 May 2026 16:51:21 +0400
X-Gm-Features: AVHnY4KqgaQ-9XSwbgGhuAGsovDUimdrkNUNiqVY75nME4u08FZPDzqsbQt-4qQ
Message-ID: <CAMxuvawAmueJxpUxrxEEhsfiz05uZBTK-q+2BcCa=nB--QCCvQ@mail.gmail.com>
Subject: Re: [PATCH RFC] virtio-mem: add shared/private memory property details
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nnAuLQB9wDFMlrze4nPT6u0QJE_uyEFXB04A3T0SW8k_1779799894
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 20, 2026 at 7:23=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 5/18/26 13:39, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, May 13, 2026 at 8:07=E2=80=AFPM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> >>
> >> On 4/15/26 16:54, marcandre.lureau@redhat.com wrote:
> >>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>>
> >>> Add specification text for platforms where system RAM has a
> >>> shared/private property (e.g., confidential computing environments su=
ch
> >>> as AMD SEV-SNP or Intel TDX). Define the device and driver requiremen=
ts
> >>> for memory state transitions during plug/unplug operations, and
> >>> guidance for VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE case.
> >>>
> >>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>> ---
> >>>  device-types/mem/description.tex | 37 ++++++++++++++++++++++++++++++=
--
> >>>  1 file changed, 35 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/device-types/mem/description.tex b/device-types/mem/desc=
ription.tex
> >>> index 9acf63f..1eefea0 100644
> >>> --- a/device-types/mem/description.tex
> >>> +++ b/device-types/mem/description.tex
> >>> @@ -42,6 +42,18 @@ \section{Memory Device}\label{sec:Device Types / M=
emory Device}
> >>>  provides the exact same properties with the exact same semantics for
> >>>  plugged device memory as available for comparable RAM in the same co=
nfiguration.
> >>>
> >>> +In some configurations, system RAM might additionally have a shared/=
private
> >>> +property, indicating whether memory is accessible to both the guest =
and the
> >>> +host (shared) or only to the guest (private). \footnote{For example,=
 in
> >>> +confidential computing environments such as AMD SEV-SNP or Intel TDX=
.
> >>> +The mechanism for converting between shared and private states is
> >>> +platform-specific; for example, it might involve dedicated CPU instr=
uctions
> >>> +or hypercalls.} The device provides unplugged memory in the shared s=
tate.
> >>> +When memory blocks are plugged, the driver is expected to convert th=
em to
> >>> +the private state before use. Unless VIRTIO_MEM_F_UNPLUGGED_INACCESS=
IBLE
> >>> +has been negotiated, the driver is expected to convert them back to =
the
> >>> +shared state before unplugging.
> >>
> >> VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE is a legacy leftover.
> >>
> >> Should we rather enforce that such devices in CoCo environments MUST a=
dvertise
> >> VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE? So they would always have to be c=
onverted back.
> >
> > If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE is negotiated, the guest
> > doesn't have to convert it back.
> >
> > I am not sure enforcing VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE for CoCo
> > is the right call.
>
> Can you elaborate why? What's the use case and would it actually work, fo=
r
> example, in QEMU with a CoCo VM?

Sorry, I misunderstood the purpose of the flag. It prevents the guest
from accessing unplugged memory (I thought it was meant for the host).

So let's make this a MUST

>
> [...]
>
> >>
> >> Is it guaranteed on all platforms (TDX/SEV-SNP/CCA/...) that hotplugge=
d memory
> >> will appear in the shared state? I have some faint recollection that s=
ome
> >> platforms would start out with new memory in the private state (that t=
hey would
> >> still have to accept before use. But cocneptually, the memory is in th=
e private
> >> state).
> >
> > My knowledge is limited. I think the platform doesn't enforce this; it
> > depends on the implementation. To fix plug/replug I propose to enforce
> > the state from either fully shared or private:
> > https://patchew.org/QEMU/20260504-rdm5-v4-0-bdf61e57c1e1@redhat.com/202=
60504-rdm5-v4-13-bdf61e57c1e1@redhat.com/
>
> Okay, that only touches TDX. We really have to be careful here to not doc=
ument
> something that is specific to one platform.
>
> I can try asking some folks in the bi-weekly guest-memfd call in June.

ok, thanks!

