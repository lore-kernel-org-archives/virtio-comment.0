Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1384E253343
	for <virtio-comment@lists.linux.dev>; Wed,  5 Mar 2025 19:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201737; cv=none; b=qZpz/x9TmMTAM+0eqrvTOljdwLEsv60Hn3WWG34strffWbO1gypu7RePi0ECyf4o5Izhn60TtzZU+RT8uJETfXBQUDgy6Ci1CzgtwEfXr632Dz+mHx47yUqCnTu42xPKGf22vP4PxlL6XOPDig7jIv04KOKaCGDH93ozILbtP9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201737; c=relaxed/simple;
	bh=gWmcbZqnFevQz6cUj6VmgbHv1hjYUGl+kru7814eViw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Content-Type; b=l+wp5ClQPsm2sOXk+1BTLwppiwF/zTO/LsHs5EIYnwnbrzR/VDA8rQTbvt3+hYmSsE8BznnYFdrSjRWT0CkdCh1DkbgAWl3paVmHTYYdUXbXuTo+csnDni/HaVzOdeTxRAJsrl77TTqaXAUoJcSsGPd2X543tOSv/HsbSVPhiFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TWhejz8e; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TWhejz8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741201732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vnNkr05smpDdTPQPiDC5CpnngY84PrEW5U6ErKIz4jA=;
	b=TWhejz8ebP7En7/JTiiZCuJaHhGxwXL9UULJTEcv21zbjsyHUEpTU4cVea0Vm9WoOCFqla
	u1HccDGJ1WBS1HYSiVgsyGSdZpmrVErY3utCo0VHG74xeKQtY9ELwAouihaWYaPIEV85Zi
	iTc6ljZoIT/sdHaHJCehvpTv6qyeZI0=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-shl9iznFPeSqsT-rPUJrcg-1; Wed, 05 Mar 2025 14:08:36 -0500
X-MC-Unique: shl9iznFPeSqsT-rPUJrcg-1
X-Mimecast-MFC-AGG-ID: shl9iznFPeSqsT-rPUJrcg_1741201715
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fe8c697ec3so2132932a91.1
        for <virtio-comment@lists.linux.dev>; Wed, 05 Mar 2025 11:08:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201714; x=1741806514;
        h=content-transfer-encoding:to:subject:message-id:date:mime-version
         :references:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8hT4IhhEMOqh2L7n7a3CbdylrVRb8pPCAm9kvx+1paY=;
        b=n+gqV4vxFXeVNjqk4HhWdobtVj7WXunyTV+Tuqxxy6X6ap5kk+g7xkYsaMMlwqqr60
         FaoLmHlOAJ5+1dO17OjSHMVbTgwidzLTtt4SYmNAx3A9A6coDlpy4/YNPObmqE5EDCcN
         1xrLs4S1WENCqZzqaDZ5YJke3gXgCa0HR5GOQySA+VZLYAv+GlQOynrKKNKoup0shzKI
         7UHLmk4XeVgKsIImnqBAuyyO5pjBCZAaL6nBDlZUkYcjU3zJ9J2rJ5e2RpAdEuRBCz9c
         dodBuOtZ9KnNJypagQDa6CRMW8dfnYhpwPXRm/773viaPtaTm1IqGKF1TD5yhahNh0Ii
         +45g==
X-Forwarded-Encrypted: i=1; AJvYcCUYZddHqdsBLYXMbQ2h0N/8pIxPxByLSLJIa3sZBgsCRa+lrD0/mJvNF8rysDzcFu7eNw68W3CK03uXM5001Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz60PmD3qqsc9LbnSTc0S8CXwzaJ1nOBZbMeIPqUxvZq+ciV66A
	LKtVXRLLm+1vKCB1WmG4QDsywGqUny3p59BkAkQGrH70EYGtjda5X6ecUX5S+hMxNJIFeOyBSMS
	GpjyrcXUyFKUOcLBlQ1+K4g6/lLmxeGDwxktiz7qoicIcAsYj4PCli9J/yDKF/k0CNxC55D536Q
	PlGYN61QsCbnK6L7S0s0Uvjq9hGA5d2HsUR4m97klPCoC9zkU=
X-Gm-Gg: ASbGncuWk29LDdX6Is+jnd//wljoSUH3wm8oNzsLsVEJQMgy5MBsr2Rf51zYTIwuNki
	aOabnl3Nf6BYHLMUzs22GZvQGyfy48kKB0b8ZdFyHM1OUtiziRUQBx9g7Ow9VtbUG/iyF
X-Received: by 2002:a17:90b:2b4c:b0:2f9:d0cd:3403 with SMTP id 98e67ed59e1d1-2ff617bbe47mr736034a91.16.1741201714534;
        Wed, 05 Mar 2025 11:08:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXNZUT1/icOl0EzLDC4MLZpaMQbr3TIN2F6CRDrb53+0KeVXnxiw8WUuiW7SsVVf8VhnnxBr2faTV6qXMv7Nw=
X-Received: by 2002:a17:90b:2b4c:b0:2f9:d0cd:3403 with SMTP id
 98e67ed59e1d1-2ff617bbe47mr736001a91.16.1741201714139; Wed, 05 Mar 2025
 11:08:34 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Mar 2025 13:08:33 -0600
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <CY8PR12MB7195D6E4C35686620499D7A0DCCB2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250217115227.4961-1-slp@redhat.com> <20250217115227.4961-2-slp@redhat.com>
 <CY8PR12MB7195A2AFBB7530874D228954DCC12@CY8PR12MB7195.namprd12.prod.outlook.com>
 <CAAiTLFV2Dn_WztJ4evXLN4tFJGJ_Fqkw=xk5DD5jukvze0snQg@mail.gmail.com> <CY8PR12MB7195D6E4C35686620499D7A0DCCB2@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 5 Mar 2025 13:08:33 -0600
X-Gm-Features: AQ5f1JqI7x1icCZVwn_-LT6ygosWWSVv6BQC0CgcwUWVvDw6Z0N5ivDFhHh_Fr4
Message-ID: <CAAiTLFVwogMWq6LbxJhXqP7f=uFYnTpVxYimCmKPF8NrACDSuA@mail.gmail.com>
Subject: RE: [PATCH 1/3] shared-mem: introduce page alignment restrictions
To: Parav Pandit <parav@nvidia.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UVr_TRMUwnhnGHzDeZPOU5bgFplD0iV6vodsXeHhAl0_1741201715
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Parav Pandit <parav@nvidia.com> writes:

>> From: Sergio Lopez Pascual <slp@redhat.com>
>> Sent: Wednesday, February 26, 2025 11:20 PM
>> Parav Pandit <parav@nvidia.com> writes:
>>
>> >> From: Sergio Lopez <slp@redhat.com>
>> >> Sent: Monday, February 17, 2025 5:22 PM
>> >>
>> >> Add a subsection for page alignment restrictions and introduce the
>> >> VIRTIO_F_SHM_PAGE_SIZE feature bit.
>> >>
>> >> Signed-off-by: Sergio Lopez <slp@redhat.com>
>> >> ---
>> >>  content.tex    | 3 +++
>> >>  shared-mem.tex | 7 +++++++
>> >>  2 files changed, 10 insertions(+)
>> >>
>> >> diff --git a/content.tex b/content.tex index c17ffa6..575065d 100644
>> >> --- a/content.tex
>> >> +++ b/content.tex
>> >> @@ -872,6 +872,9 @@ \chapter{Reserved Feature
>> >> Bits}\label{sec:Reserved Feature Bits}
>> >>  =09\ref{devicenormative:Basic Facilities of a Virtio Device / Featur=
e
>> >> Bits} for
>> >>  =09handling features reserved for future use.
>> >>
>> >> +  \item[VIRTIO_F_SHM_PAGE_SIZE(42)] This feature indicates that the
>> >> + device  transport provides information about the supported page siz=
e.
>> >> +
>> >
>> > Please extend the description around "Feature Bits" section to increas=
e 24
>> to 41 -> 24 to 42.
>>
>> Ack.
>>
>> >>  \end{description}
>> >>
>> >>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature
>> >> Bits} diff --git a/shared-mem.tex b/shared-mem.tex index
>> >> 6e6f6c4..dd90cb7 100644
>> >> --- a/shared-mem.tex
>> >> +++ b/shared-mem.tex
>> >> @@ -34,6 +34,13 @@ \subsection{Addressing within
>> >> regions}\label{sec:Basic Facilities of a Virtio De  The \field{shmid}
>> >> may be explicit or may be inferred from the  context of the reference=
.
>> >>
>> >> +\subsection{Page alignment restrictions}\label{sec:Basic Facilities
>> >> +of a Virtio Device / Shared Memory Regions / Page alignment
>> >> +restrictions}
>> >> +
>> >> +If VIRTIO_F_SHM_PAGE_SIZE has been negotiated, when requesting the
>> >> +device to map memory into a shared memory region, the driver MUST
>> >> +obtain the page size information from the transport and honor the
>> >> +page alignment constrains derived from that page size.
>> >> +
>> > A device requirement is also needed to indicate that pci capability fi=
eld is
>> only valid after/when the feature is negotiated.
>>
>> Ack.
> I don=E2=80=99t think this is necessary because you say "driver obtains t=
he information".
> So to obtain a free information, feature bit is not necessary, this can b=
e self-described in the pci capability itself.
> If a pci capability padding_bit_0 is set, it can tell rest of the bits ha=
ve abc meaning.
> This way pci capabilities are self-contained.
>
>>
>> >>  \devicenormative{\subsection}{Shared Memory Regions}{Basic
>> >> Facilities of a Virtio  Device / Shared Memory Regions}  Shared
>> >> memory regions MUST NOT expose shared memory regions which
>> >> --
>> >> 2.48.1
>> >>
>> > 1. Shared memory cap is already defined as
>> VIRTIO_PCI_CAP_SHARED_MEMORY_CFG.
>> > This capability should be extended instead of polluting generic struct=
ure
>> field of padding.
>> >
>> > If its done in generic way like proposed, you need to call out that pa=
ge_size
>> field is only valid for VIRTIO_PCI_CAP_SHARED_MEMORY_CFG.
>> >
>> > Overall extending pci cap structure is not good idea even though it ma=
y
>> appear as small change for below reasons.
>> >
>> > 1. PCI spec already ran out of total bytes that can be stored in the c=
apability
>> section. Extending it will not help.
>> > A virtio level extended capability is not good either due to below gui=
dance
>> from PCI-SIG.
>> >
>> > 2. PCI spec highly discouraged putting vendor specific bits like this =
in the
>> capability section.
>> > Citation: "It is strongly recommended that PCI Express devices place
>> > no registers in Configuration Space other than those in headers or Cap=
ability
>> structures architected by applicable PCI specifications."
>>
>> Honestly, making it clear that the field is only valid for
>> VIRTIO_PCI_CAP_SHARED_MEMORY_CFG _and_ when
>> VIRTIO_F_SHM_PAGE_SIZE has been negotiated (I can extend the comment of
>> the field itself to clarify that, otherwise, it just acts as padding), I=
 fail to see
>> which kind of problems might bring, but admitedly I'm not a PCI expert b=
y any
>> means.
>>
> Feature negotiation for information exposed by the device is not needed.
>
>> If using the padding is really not an option, would it be reasonable to
>> introduce a different variant of "virtio_pci_cap64" struct, including th=
e
>> page_size, to be used when VIRTIO_F_SHM_PAGE_SIZE has been negotiated?
>>
> It can be extended. It just not right way to do so in pci specs boundary.
>
>> IIUC, "virtio_pci_cap64" is VIRTIO-specific, so this shouldn't have impa=
ct
>> anywhere else.
>>
>> > So, you should consider discovering the shared memory page size and mo=
re
>> such fields using device administration commands.
>> >
>> > It may sound overkill to use administration commands for 8-bits of
>> > page size, but as more generic and device specific things evolve, it i=
s likely
>> useful vehicle where you don't have to search hard to squeeze things in =
some
>> existing structure like pci capability.
>>
>> Do you mean using an adminitration queue (VIRTIO_F_ADMIN_VQ)? If so, yes=
,
>> I think it's extremely overkill for both the device and the driver.
>> If possible, I would like explore every other option before resorting to=
 this
>> one.
>>
> Right. I agree that exposing this information via admin command is overki=
ll.
> Do you agree that shared memory interface wont grow anymore further, only=
 thing it needs now or in any near term is just one or two bytes of page si=
ze information?
> If yes, packing inside the pci cap seems fine.
> If one needs to start expanding this more, than more mature interface lik=
e admin cmd will be useful.

I can't think of any more information that would be needed to be added
to the SHM interface beyond the page size. In a certain sense, it could
be argued that it should have been there when shared memory regions were
first introduced, since knowing the alignment restrictions for the maps
is a requirement to able to make use of the region. It worked so far
just because 4K page systems/VMs were prevalent.

Thanks!
Sergio.

