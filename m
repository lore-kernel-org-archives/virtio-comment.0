Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3425E15531B
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 22:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720736864; cv=none; b=PXBy5OJmOJFFXCW2YLWoNmfgpHOKQxZfaHR2a47ww8PplbQlF3FqKyVKF08h+0qqk5M1ugvbLZ33dvPCs/FnaGUjTIvbjPNcfj74Kxpu+pYtN3yv3w/tbOGkg2+pUpA6l1en0dCCLNSpY7UGG3sWY8Njg/NVZfaHQwcTC7V3Z4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720736864; c=relaxed/simple;
	bh=5DcgIgrlGhZqtKxC9EnX1aOwFNyV39VyA/BAp63yUAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cTS4lGxA2AoATFufuFa/Auc0WwKj0lT+UpNsyz4BhS+TKu4Nb7mqPR0Ogi9og9vuT6+Ka/CYcDdiTnq2isrJ+GfOirtZjxTPhKIqg8HIszhhF9GzF2/ysOYnshZFLSi4gfksIVXM34hN8oF3RzfpsNJzKolQFOD7EqXtQ+yloHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hgDJLoUt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hgDJLoUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720736861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQAA5KVajQXv0scCu8AMR3+FtY/yh7ZpE9FFtosC3cU=;
	b=hgDJLoUt7UBwidG1FVSBibuw7ZIjtZ01qhcTNgK/oduhZEspwXB0u9APCAgvBkR61TvvJC
	chV/uVsQ3qFqLFvDtgshet+E2I/oWBN/PBxY1BsEk5tIOF/JEqYD2WqQKdAyM7imQne7sW
	3q7JQb1kbHYC8IN0mE1q00ItyRV52Ao=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-aakW4zSuNvy0C9u7KIFhYA-1; Thu, 11 Jul 2024 18:27:39 -0400
X-MC-Unique: aakW4zSuNvy0C9u7KIFhYA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42666ed2d5fso8336595e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 15:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720736858; x=1721341658;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQAA5KVajQXv0scCu8AMR3+FtY/yh7ZpE9FFtosC3cU=;
        b=oJ3NZbqDYKmMy2/5Mbza2UgA/AjPpSW4k6sqniKX9wcIVK9kCRj1bqBlvkIHyrsocV
         zn5+NIBRWiuv+gcI0wHROgXpjVrcuDN0RGq01fOgRaTMpmCVI1LjSognbYODngb3F/ar
         k5gs2gH/JVfBBFzUxfYNtE9vqE0n1uiz8vcC3C8+DfPimrn+OxAkKYscMLaqTRayh9+6
         nvgiv8AVdB2wLlWdxgBtBKEzVkvr78WPaAONlj/ZTp13CqGszMjgSMu5SnP/N/YkLO7X
         MK4mHUMd35c9sWhKoXTP7hn5y9Npw1fCdHDVhfPQ1TngYPT7HoAu8vlQ5QEhQxAPxT0F
         JDtg==
X-Gm-Message-State: AOJu0YwnYkjfd28GE41yJJWq0eG7yIC5F6L9V9cRfQfWyS5Vs3kDBScZ
	a3zYPQQ1ykBQ5iQTp6/9D5vJ1mn08DxF6xuoKonQBq0tmYFXaitZfXvnGwbjw4M85Oi963aZQOh
	Gm5GRu6pJRSP9zHpf10TSfqiSEaYeI1Y3tNi2bxQXDYAczQ7+ympETTm53f7DL3sm
X-Received: by 2002:a05:600c:524f:b0:427:9db3:46ad with SMTP id 5b1f17b1804b1-4279db346b8mr5158795e9.23.1720736858569;
        Thu, 11 Jul 2024 15:27:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjZkTdxexx5iVpMUvs7s/7UpqkR/dOum5muXSdVejzDwfwS9sMu+vtY0CO3BZJYr/kGLf0qA==
X-Received: by 2002:a05:600c:524f:b0:427:9db3:46ad with SMTP id 5b1f17b1804b1-4279db346b8mr5158625e9.23.1720736857626;
        Thu, 11 Jul 2024 15:27:37 -0700 (PDT)
Received: from redhat.com ([2a02:14f:173:2166:83a4:d566:a055:a5a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f289c37sm2494475e9.30.2024.07.11.15.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 15:27:37 -0700 (PDT)
Date: Thu, 11 Jul 2024 18:27:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <pandit.parav@gmail.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [GIT PULL virtio 00/40] virtio master branch with fixes and
 admin commands
Message-ID: <20240711181520-mutt-send-email-mst@kernel.org>
References: <20240711202352.3228345-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240711202352.3228345-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 11, 2024 at 11:23:52PM +0300, Parav Pandit wrote:
> Hi Michael, Cornelia,
> 
> The following changes since commit 37c6a406678a5ee891fdf5671298cb4fcfa517f2:
> 
>   sound: add sampling rates 12000Hz and 24000Hz (2024-02-16 11:55:25 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/paravmellanox/virtio-spec.git tags/for_1.4
> 
> for you to fetch changes up to 74bf759aef3bf10447aadcb841c66dc5e6a578d6:
> 
>   virtio_pci_cap64: specify offset_hi, length_hi endianness (2024-07-11 20:54:20 +0300)
> 
> ----------------------------------------------------------------
> This tag contains virtio master branch and set of patches of administration commands, pci fix, blk config fix, and net description fixes
> 
> - editorial changes froom master branch
> - virtio blk and pci capabilities data type fixes
> - virtio net header description update
> - adminstration commands for flow filters
> - administration commands for device parts
> 
> Generated PDF and also the diff pdf were verified using makepdf.sh, makediffall.sh and makediffpdf.sh.
> 
> ----------------------------------------------------------------
> Cornelia Huck (12):
>       edit: remove old changelog
>       edit: add changelog for 1.3
>       acknowledgements: update for 1.3
>       editorial: update copyright date in PDF footer to 2023
>       change revisions: diff from v1.2, current v1.3
>       title: note that 1.3 supercedes 1.2
>       revision: update date
>       remove enumerate usage that makes the tool unhappy
>       Revert "remove enumerate usage that makes the tool unhappy"
>       editorial: various fixes for 1.3-csd01
>       editorial: update "Computer Language Definitions" URL
>       makediff: update list of cherry-picks
> 
> Kröning (1):
>       virtio_pci_cap64: specify offset_hi, length_hi endianness
> 
> Michael S. Tsirkin (5):
>       changelog: tweak column width
>       changelog: formatting fixes
>       work around extra row
>       html: add missing enumitem package
>       README.md: update mailing list info
> 
> Parav Pandit (22):
>       virtio-blk: Fix data type of num_queues field
>       virtio-net: Fix receive buffer size calculation text
>       virtio-net: Clarify the size of the struct virtio_net_hdr for tx
>       virtio-net: Annotate virtio_net_hdr as field
>       admin: Introduce self group
>       admin: Use already defined names for the legacy commands
>       admin: Add theory of operation for capability admin commands
>       admin: Prepare table for multipage listing
>       admin: Add capability admin commands
>       admin: Add theory of operation for device resource objects
>       admin: Add device resource objects admin commands
>       virtio-net: Add theory of operation for flow filter
>       virtio-net: Add flow filter capability
>       virtio-net: Add flow filter group, classifier and rule resource objects
>       virtio-net: Add flow filter device and driver requirements
>       newdevice: Improve the appendix chapter heading to reflect the content
>       newdevice: Extend informative guidance on capability, resource objects
>       admin: Add theory of operation for device parts
>       admin: Extend resource objects for sr-iov group type
>       admin: Add admin commands for device parts
>       admin: Define common device parts
>       admin: Add requirements of device parts commands
> 
>  CONTRIBUTING.md                         |    2 +-
>  DIFFVERSION                             |    2 +-
>  README.md                               |   80 +-
>  REVISION                                |    2 +-
>  REVISION-DATE                           |    2 +-
>  acknowledgements.tex                    |  124 +-
>  admin-cmds-capabilities.tex             |  249 +++
>  admin-cmds-device-parts.tex             |  469 +++++
>  admin-cmds-legacy-interface.tex         |   24 +-
>  admin-cmds-resource-objects.tex         |  287 +++
>  admin.tex                               |   61 +-
>  changelog.tex                           |    6 +-
>  cl-cs02-12.tex                          | 2593 +++++++++++++++++++++++++++
>  cl-os.tex                               | 2897 +++++++++++++------------------
>  conformance.tex                         |    6 +
>  content.tex                             |    1 +
>  device-parts.tex                        |  231 +++
>  device-types/blk/description.tex        |    2 +-
>  device-types/net/description.tex        |  646 ++++++-
>  device-types/net/device-conformance.tex |    1 +
>  device-types/net/driver-conformance.tex |    1 +
>  introduction.tex                        |   32 +-
>  makediff.sh                             |    3 +-
>  newdevice.tex                           |   62 +-
>  specvars.tex                            |    2 +-
>  title.tex                               |   15 +-
>  transport-pci.tex                       |    4 +-
>  virtio-html.tex                         |    1 +
>  virtio.tex                              |    3 +
>  29 files changed, 6001 insertions(+), 1807 deletions(-)
>  create mode 100644 admin-cmds-capabilities.tex
>  create mode 100644 admin-cmds-device-parts.tex
>  create mode 100644 admin-cmds-resource-objects.tex
>  create mode 100644 cl-cs02-12.tex
>  create mode 100644 device-parts.tex

Thanks for working on this!
I made some changes to master, and I also merged master into 1.4.

I also see undefined references with this, related to device
parts things.  Which I guess means the original patch was broken.

So what I did is cherry-pick the rest of patches.
Update 1.4 you will see what happened.

As for device parts, you need to fix them up.
I do not remember if we discussed it, but I think you
are abusing hyperref for no reason there.

So my suggestion is, send a patch replacing all the
hyperref cuteness with simple ref and fixing broken links at the
same time.

OK?

-- 
MST

