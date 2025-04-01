Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA401EF39A
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743500018; cv=none; b=GM4xF/X+p6L3PZ1oWluRv/EyM1rc1mM1CSgrpxRdSzlauVPlTgYQ60Vx+kItcbFo0iqyCPF+oy4H40Lc6mOCuipaFIDEDtZn/AstEPAzzXd2zBCLradPUlRLgdtPFK4N/rlYovnfHJP7UngY+dlJAIuT8m/p+32gy7SjEjv4m6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743500018; c=relaxed/simple;
	bh=35NNVI9nXXOuu2MbAgG+KklPqJPIISRuUSpHbMjKgiQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XSkb1SuHk+ful/7nJ7KVNNMYqM6snKeo9XfTObWi5ZjnxClxVrrW6RibBNq9qeDgPo+jH/Y87zN35eaxyknAUs13nk4Syt/Z5adnnlu/jL3J7sfsOwrSfiq+MVktscwXQIlHypdhkWPofqpk+eOxBvDWnMkkKb5rbIGgmwoXjjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KNbk8uXp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KNbk8uXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743500015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Po0hYzILgALeWHrkyCsGgrbqLXs6Z9wqXESJJGe5spY=;
	b=KNbk8uXpgYfRl20WE/+aT9BXbYi2Pl/Buq6if9Q2qvOUzYQlUOXwYEtfFWjSYN5N9rbmQu
	xAiabIim7AmKdiKCK5TKLEZUP+WFRAIetzox/b/fJC+v7djrh0cPwvIuIzXtFbVwJNo4cN
	MPUMpxcAJJpSHqtKSzJNQkggQM+3MLI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-5IswhgP_M-iqbN8G2nQtaA-1; Tue, 01 Apr 2025 05:33:33 -0400
X-MC-Unique: 5IswhgP_M-iqbN8G2nQtaA-1
X-Mimecast-MFC-AGG-ID: 5IswhgP_M-iqbN8G2nQtaA_1743500013
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff605a7a43so15272753a91.3
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 02:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743500012; x=1744104812;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Po0hYzILgALeWHrkyCsGgrbqLXs6Z9wqXESJJGe5spY=;
        b=sPqfi3ySHrZwI583ESkYjlzgGJwqrdfQY2O9g3yzaRAzQheIl9hbB4gz39DLpe8oG5
         eFz+izuPJeZFG7+9t6aRDKNCyzFw/0dMMUHkNJF7tBVh73AtHzmDO6g16GLyhWbKA5Ow
         sFfAxcAogPucUvAy4f7T9vZMF7+jTeVm36sgB3gbbNHgNNAG8yR4FapCF15aqtSe+/BY
         YCx4xsvZkDUBzUbEkCS8PQWNIB7w5A4CGJfjmXfjr+1YKYKAVs1uFSCVbBfe87tkxSP1
         AgloQHzFS3mTqtlbrQYPznaEJBCxaQVnIpdBkVtNFsNI26KDwmIrbVoU7f5YykfZclJL
         g2PQ==
X-Gm-Message-State: AOJu0Yy/iYHF/ixToiR0jb0Xu031z7ptp+dyJ1Mw4zPaaM7Qbe2oEco/
	MqxRWxm1h3m9kIK9Imf4FOimb5wn95/40gKwInwjkQed+YHHg3wI5bCyxv259UZ9G7n6rBp9rC9
	tnS5QQ57og1+7X3yQuL/A4ybBdbUNzZjehqdlCBts/YUtb8JYUXdSi2tFYMUT6ISFF7eHCJRCXs
	h2aM4yv3I72aghEEQIN5KN/ADvjVDmyulFCCyhBHQ=
X-Gm-Gg: ASbGnct791no+A2xfCW/hm0wblK52wkvp42p/8F2iF3xCbYHJ81iGV2oNAqr+hsdQhH
	eaO9fjqLjK/gjRXZUIhEGWap+ORZ9PetYlv3oI7UYSUdQ02MZayLk6UO0L1HuAOm4f5lxxA==
X-Received: by 2002:a17:90b:534c:b0:2fe:b735:87da with SMTP id 98e67ed59e1d1-30531e89df0mr22391206a91.0.1743500012567;
        Tue, 01 Apr 2025 02:33:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELtaPoQhZs4DAUvC5/hUqBE3bEaUQCRKCTGODCYoeC9nZ/vBb/WU+0H5U5tvGiPK0Q5F1T251w4WorIXd5F38=
X-Received: by 2002:a17:90b:534c:b0:2fe:b735:87da with SMTP id
 98e67ed59e1d1-30531e89df0mr22391181a91.0.1743500012174; Tue, 01 Apr 2025
 02:33:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Apr 2025 02:33:31 -0700
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <CY8PR12MB7195A0BA1C5D6946196D65DCDCAC2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250331150548.50595-1-slp@redhat.com> <20250331150548.50595-2-slp@redhat.com>
 <20250331121538-mutt-send-email-mst@kernel.org> <CAAiTLFXdYDSgZnYAgGC-FpMcyOnqBZpiTrHOk=4x_jFiRzkcbg@mail.gmail.com>
 <20250401050828-mutt-send-email-mst@kernel.org> <CY8PR12MB7195A0BA1C5D6946196D65DCDCAC2@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 1 Apr 2025 02:33:31 -0700
X-Gm-Features: AQ5f1JpeOcxOK82HhYozYdm9I9lPW-4Is18dAnExlG2phD-9ac2ui2V8YgxyHp8
Message-ID: <CAAiTLFX_RmzJfuLaJ+95S+k6Y20o62Hzyxwe+HwHRzkob=NCkA@mail.gmail.com>
Subject: RE: [PATCH v2 1/3] shared-mem: introduce page alignment restrictions
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xJSuU2YqdMVUKHvcUikJoZsb_1hNLQvZMvwYzuKiRCI_1743500013
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Parav Pandit <parav@nvidia.com> writes:

>> From: Michael S. Tsirkin <mst@redhat.com>
>> Sent: Tuesday, April 1, 2025 2:45 PM
>>
>> On Mon, Mar 31, 2025 at 09:40:37AM -0700, Sergio Lopez Pascual wrote:
>> > "Michael S. Tsirkin" <mst@redhat.com> writes:
>> >
>> > > On Mon, Mar 31, 2025 at 11:05:46AM -0400, Sergio Lopez wrote:
>> > >> Add a subsection for page alignment restrictions.
>> > >>
>> > >> Signed-off-by: Sergio Lopez <slp@redhat.com>
>> > >> ---
>> > >>  shared-mem.tex | 6 ++++++
>> > >>  1 file changed, 6 insertions(+)
>> > >>
>> > >> diff --git a/shared-mem.tex b/shared-mem.tex index 6e6f6c4..2021083
>> > >> 100644
>> > >> --- a/shared-mem.tex
>> > >> +++ b/shared-mem.tex
>> > >> @@ -34,6 +34,12 @@ \subsection{Addressing within
>> > >> regions}\label{sec:Basic Facilities of a Virtio De  The
>> > >> \field{shmid} may be explicit or may be inferred from the  context of the
>> reference.
>> > >>
>> > >> +\subsection{Page alignment restrictions}\label{sec:Basic
>> > >> +Facilities of a Virtio Device / Shared Memory Regions / Page
>> > >> +alignment restrictions}
>> > >> +
>> > >> +When requesting the device to map memory into a shared memory
>> > >> +region the driver MUST obtain the page size information from the
>> > >> +transport and honor the page alignment constrains derived from that
>> page size.
>> > >> +
>> > >
>> > > will make existing drivers autmatically incompliant with new devices.
>> > >
>> > > we generally avoid things like this.
>> >
>> > This is the reason why in v1 this was gated behind
>> > VIRTIO_F_SHM_PAGE_SIZE. But from the discussion on that thread, I
>> > understood that, at least for the PCI transport, it was preferred to
>> > have the page_shift field unconditionally:
>> >
>> > https://lore.kernel.org/virtio-
>> comment/CY8PR12MB71950314C5683EB7CFF081
>> > 5BDCCA2@CY8PR12MB7195.namprd12.prod.outlook.com/
>> >
>> > Did I misunderstand the conclusions?
>> >
>> > Sergio.
>>
>> I think Parav missed this compatibility implication when he said:
>>
>> 	So to obtain a free information, feature bit is not necessary, this can
>> be self-
>> 	described in the pci capability itself.
>>
>> Parav, this is about the MUST requirement referring to honoring alignment,
>> not about obtaining the information which indeed can be done without.
>>
> It can't be MUST requirement as it breaks the driver which will not negotiate this feature bit.
> So my understanding is, the device indicates one or multiple alignments it supports and driver can choose which alignment it wants to use to get better performance.

Not exactly. The device indicates its supported page size (just one),
which implies the driver needs to honor the alignment restrictions
derived from that page size.

Just to clarify, this is not a performance improvement. Today, there are
devices (i.e. virtio-gpu) that doesn't work when the host (device) is
running with on a system with a bigger page size than the guest
(driver).

Thanks,
Sergio.

