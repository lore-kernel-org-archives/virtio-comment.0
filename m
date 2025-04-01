Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F622AEFE
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 09:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498882; cv=none; b=drv0MxY4TUOWeZIZZ7oJ1gKAgs4gWb8MESJ1jT/u1CVgPZxgY9QCVpOB10aKQCx0a360uUZbynSFWZxj1UqzsAiypn8AT+Ph653xNiZZFN3xvbIxUIUtgU+EojZ+zLQ7jxzBBhmu67aU+3QTku2wP9LGc706i9tG6jrRpJkrTQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498882; c=relaxed/simple;
	bh=E/vsrp+tSsIGKKxo9X06HmnrHcx3RYVdQHjxZMv8l1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=WydiUI16wj9SYYNyNMTegf5P5LaFN+Ft5GoCplc9IXfEJ0nXK/2UKRm8UOcfoD8RgoXFnGZ9zEIs6OR+747cvKIpNbiGl3DuMQ6UnT7nsF/IhjeCIK+0NX0ChHcXNo1cmQRJHE3M+g4vS9Z0p2busOUo+VjZZIOPYrt3ZPb2Aic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LfxL+2sa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LfxL+2sa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743498879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oTiIchvLh/vC6mvrKGAu5eiEwLNcg7c/CLFGpeZOUDM=;
	b=LfxL+2sag28l5C/dG2YhO9UUUDBAY0vO5FWfolAwITJfkBWFHXGMs4hh5mZOKxns4OymJY
	1EkfqeUAL9Tq81r2KhtTHjfKONix/sqQlCdU1eE5c5MR5C8NSePc1KtVnWcKrWZxMzWtJe
	4bSru8NOnsaV6zeJEm5X/ETk5y+UZpo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-4SjRDeAKNc2FgAHW_zKzCw-1; Tue, 01 Apr 2025 05:14:37 -0400
X-MC-Unique: 4SjRDeAKNc2FgAHW_zKzCw-1
X-Mimecast-MFC-AGG-ID: 4SjRDeAKNc2FgAHW_zKzCw_1743498877
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3913d8d7c3eso2785106f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 02:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743498876; x=1744103676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTiIchvLh/vC6mvrKGAu5eiEwLNcg7c/CLFGpeZOUDM=;
        b=eJ+LRGMHMTycR0bc/JehPYLgOj9saB4p2gRE0cbLBdO/IFxqz9K+0zlm0gjZWGHLtK
         FolXXf2LSpqftaMKTCH6NLgvtVn5BNxKtHRUwi2BoUYTBPeuso7kdHA+b0zx0Ch7zQvh
         HeBtdM2+J1IRMjYUueUbF58ozCYiue7mReynYea8kBwEYPZKf6IJfDVuV+AGyJZZBK5Z
         kABJMXJTwpqLGvm2AurvmdRZ50Ae2Nf9z14uwakFWMzQ1/crNxU+6Jw/FJf2cixu7qzg
         S3VDfQyiDyi+YRnFSxj7nKif1OnzxU+lmfaSzNsm9x3ElUoKlO5Vhteoi5JU3oWH1JYz
         BVDg==
X-Gm-Message-State: AOJu0YxdHHITuiWrZBK5ov+dIVoko2RJ8pfiPLSsSheuZXiK6x1BIuh2
	v1gkltsQ0d/HEY2CKgIOBD5ZlacoWOTtRbtgmPhmduGFzmlXUvCgMgmWjTuLEqbwJ8KSSAdqYxD
	jsvfRy/6iESMDfqaq4+oWnzJvjsz3PWaYb/e2DmzJsbcBQDOx3MBvwMcnFG2zR/XAt+lFRa4h
X-Gm-Gg: ASbGncueLNDgPdX2e2LSu9QJGFYuZWkgT8gVhG77oSJuT0inpvvc3R8N4bzbWVQ/6HH
	Iv1uvEB19ns4HeaGpaFTehBQb4moJi31VtLuPVujb3qQ9HffQZcQO6m8lfvU33Fe0nVVF/s7FEx
	EeW8hoT5g+zMFcdtmu1eaSISPRI0L3UG/EvLr8suNimhGLHKmQEmPvjzmDtK+5DK2EwkcrHxeX4
	5BOLOPzCDZQoc4WhaA80g+7b5xfpvpKs9Eg4xTqrBqsjDInxCymmGDOLhfMO3SszmoKLzxwwV5N
	5TMQ2eWPKg==
X-Received: by 2002:a05:6000:240b:b0:39c:13fd:ec44 with SMTP id ffacd0b85a97d-39c13fdedd2mr10196220f8f.5.1743498876347;
        Tue, 01 Apr 2025 02:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6zwTN8Nm89WhnxFX+QAkMneJOqCRTd9HAP3IVzdNCKiVRQT8n4qsJdhJsL9i9gIsuh0XvOg==
X-Received: by 2002:a05:6000:240b:b0:39c:13fd:ec44 with SMTP id ffacd0b85a97d-39c13fdedd2mr10196206f8f.5.1743498876006;
        Tue, 01 Apr 2025 02:14:36 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efdffdsm191578985e9.18.2025.04.01.02.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:14:35 -0700 (PDT)
Date: Tue, 1 Apr 2025 05:14:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sergio Lopez Pascual <slp@redhat.com>
Cc: virtio-comment@lists.linux.dev, dmitry.osipenko@collabora.com,
	parav@nvidia.com
Subject: Re: [PATCH v2 1/3] shared-mem: introduce page alignment restrictions
Message-ID: <20250401050828-mutt-send-email-mst@kernel.org>
References: <20250331150548.50595-1-slp@redhat.com>
 <20250331150548.50595-2-slp@redhat.com>
 <20250331121538-mutt-send-email-mst@kernel.org>
 <CAAiTLFXdYDSgZnYAgGC-FpMcyOnqBZpiTrHOk=4x_jFiRzkcbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAiTLFXdYDSgZnYAgGC-FpMcyOnqBZpiTrHOk=4x_jFiRzkcbg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QUCBHciSTg1aodjKy4NF0nRVuX0zvSAxh7vm-SAJcWY_1743498877
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 31, 2025 at 09:40:37AM -0700, Sergio Lopez Pascual wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Mon, Mar 31, 2025 at 11:05:46AM -0400, Sergio Lopez wrote:
> >> Add a subsection for page alignment restrictions.
> >>
> >> Signed-off-by: Sergio Lopez <slp@redhat.com>
> >> ---
> >>  shared-mem.tex | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/shared-mem.tex b/shared-mem.tex
> >> index 6e6f6c4..2021083 100644
> >> --- a/shared-mem.tex
> >> +++ b/shared-mem.tex
> >> @@ -34,6 +34,12 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
> >>  The \field{shmid} may be explicit or may be inferred from the
> >>  context of the reference.
> >>
> >> +\subsection{Page alignment restrictions}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}
> >> +
> >> +When requesting the device to map memory into a shared memory region
> >> +the driver MUST obtain the page size information from the transport
> >> +and honor the page alignment constrains derived from that page size.
> >> +
> >
> > will make existing drivers autmatically incompliant with new devices.
> >
> > we generally avoid things like this.
> 
> This is the reason why in v1 this was gated behind
> VIRTIO_F_SHM_PAGE_SIZE. But from the discussion on that thread, I
> understood that, at least for the PCI transport, it was preferred to
> have the page_shift field unconditionally:
> 
> https://lore.kernel.org/virtio-comment/CY8PR12MB71950314C5683EB7CFF0815BDCCA2@CY8PR12MB7195.namprd12.prod.outlook.com/
> 
> Did I misunderstand the conclusions?
> 
> Sergio.

I think Parav missed this compatibility implication when he said:

	So to obtain a free information, feature bit is not necessary, this can be self-
	described in the pci capability itself.

Parav, this is about the MUST requirement referring to honoring
alignment, not about obtaining the information which indeed can
be done without.


-- 
MST

