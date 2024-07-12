Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6F17EF09
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 10:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720781257; cv=none; b=vBUHWW6bbOounvlzISY5oy6gMNCIDueC2PIo70e3Ru1j2xnP9DyaLt6w/ZKNUJxV4Z1DyRCK+GMoWHMDmVYpTqsj4gPx70G7LST//syErYKVf42T7qzCsmitaxVujflBZ/Qdaag/EpO/uil9cHO/3IChpFl4TAH7po9Qs/NeMUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720781257; c=relaxed/simple;
	bh=HR0Rz68rnFbEu6d9ScOEEZpT19oad3FQeV/B7qy//Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=T9XrhLjNIE8Lk+eg6tPnnUsX3fVvYDoXpZutSbp3PJtozn6fRkfFHnNg0niApri8wEqg6C3R9U04ywM7l/boVdSxO9m+2fRCEJCLTMoz1C4oyv9VnVaadHHC7ovAQakXlEzg9SRZCYAoGvJR/11mIHF9lmq4iOgz7zrUiQ9Xq80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VHUrI7Yb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VHUrI7Yb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720781254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DQNwzP07vAfmKwGTdB2/cJQ198Nr8FXJsIvoc3aXzEo=;
	b=VHUrI7Yb/2/TtlmbuAWYsKv2zAvrgcq6ZOxyaAAE5Ewd7EwC2gBzMQ8RxUAI2HnJ5VjNr3
	smBuVENDk5r79amIo4woTLVxndRkjVJubZUZq9neXwxBtya/r9RFcmxhYQBQ4I1xBX3Rh+
	MHLamG7w5kncqvRRQJKn9vcxBROwHwk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-IKT5NaATPeiGpW8yf64OKw-1; Fri, 12 Jul 2024 06:47:33 -0400
X-MC-Unique: IKT5NaATPeiGpW8yf64OKw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42725ec6d8dso17227855e9.2
        for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 03:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720781252; x=1721386052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQNwzP07vAfmKwGTdB2/cJQ198Nr8FXJsIvoc3aXzEo=;
        b=GMIy4NSDCoYxxtWrKUjJmfmEQBxopgjaFSIO3L4kR0V/EgnWSd+USaFURfUfnJ8Bp0
         Mj+e9xL3l7raOWgqtWDCKpZT3cnh8QGfh5BMrho1cKZQEvsi0h9HPHLQqG5L48H2pjN4
         qGcWoh/eLbjhPhYYFjS/4Vh3gFGXfX/1/gVsMoP9i9O54J8VkgSOjDynfAUPokdCpF0U
         pSiZ6d8WwtlymffoHDrUlHWSq4uCyXTJO1E8YaaKzQ6gGZt5fD0MZbte4W7MTebf32qa
         KCzinPtpWZY32WuK5SnV+OZaeEtKQFLIDmCIikFs0gtL1CS2V9hM5E69d5X0yCVhfflD
         CYng==
X-Gm-Message-State: AOJu0YwkOnjnU1qj9KVboAZa0xnebjkCQcwbE8698FsfJnno1XTIzS1x
	MoHZGII09iU18jX7B2dUwaZRDAouej2FCVnakJGCucMs1P5jZ0eFZA2MmokQQL7+D42utiRtDj5
	4szS+NwOFFaYUU4lqoSP5IOZMC0MDf0I7EE3TtkRQbagbh3kqAH3KtCEz9X/Gt1+e
X-Received: by 2002:a05:600c:3206:b0:426:6f4b:b386 with SMTP id 5b1f17b1804b1-426708f196emr94094355e9.34.1720781252121;
        Fri, 12 Jul 2024 03:47:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5vkvsOUPSOZRwX25rNlE86utM6UVrctyLLB+pgg416UVBAiYVIDeIVXZssLcePdAS9IfGFw==
X-Received: by 2002:a05:600c:3206:b0:426:6f4b:b386 with SMTP id 5b1f17b1804b1-426708f196emr94094165e9.34.1720781251538;
        Fri, 12 Jul 2024 03:47:31 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:761e:f82:fc9a:623b:3fd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f27846bsm19500105e9.25.2024.07.12.03.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 03:47:30 -0700 (PDT)
Date: Fri, 12 Jul 2024 06:47:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <pandit.parav@gmail.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [PULL 0/6] administration commands for device parts
Message-ID: <20240712064628-mutt-send-email-mst@kernel.org>
References: <20240712042628.3247126-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240712042628.3247126-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

subject should not have 0/6
and it should have a version.

On Fri, Jul 12, 2024 at 07:26:28AM +0300, Parav Pandit wrote:
> Hi Michael, Cornelia,
> 

put changelog here please.


> The following changes since commit dce4079825ea073ec7e60832dcbfef9756e5842f:
> 
>   virtio_pci_cap64: specify offset_hi, length_hi endianness (2024-07-11 18:30:17 -0400)
> 
> are available in the Git repository at:
> 
>   https://github.com/paravmellanox/virtio-spec.git tags/for_1.4_v1
> 
> for you to fetch changes up to 7384c5ee3d1efd6352c532dd7f4121fecd212a0b:
> 
>   editorial: replace hyperref with ref (2024-07-12 07:05:22 +0300)
> 
> ----------------------------------------------------------------
> This tag contains administration commands for device parts along
> with the suggested editorial change to remove the hyperreference.
> 
> It resolves the editorial conflict of blank line at the of file newdevice.tex
> in commit 761c87891d3d12d0f1ea5ae0bf88bc127d227346.
> 
> ----------------------------------------------------------------
> Parav Pandit (6):
>       admin: Add theory of operation for device parts
>       admin: Extend resource objects for sr-iov group type
>       admin: Add admin commands for device parts
>       admin: Define common device parts
>       admin: Add requirements of device parts commands
>       editorial: replace hyperref with ref
> 
>  admin-cmds-capabilities.tex     |  16 ++
>  admin-cmds-device-parts.tex     | 469 ++++++++++++++++++++++++++++++++++++++++
>  admin-cmds-resource-objects.tex |  29 ++-
>  admin.tex                       |  12 +-
>  conformance.tex                 |   2 +
>  content.tex                     |   1 +
>  device-parts.tex                | 232 ++++++++++++++++++++
>  newdevice.tex                   |  24 +-
>  8 files changed, 778 insertions(+), 7 deletions(-)
>  create mode 100644 admin-cmds-device-parts.tex
>  create mode 100644 device-parts.tex
> The following changes since commit dce4079825ea073ec7e60832dcbfef9756e5842f:
> 
>   virtio_pci_cap64: specify offset_hi, length_hi endianness (2024-07-11 18:30:17 -0400)
> 
> are available in the Git repository at:
> 
>   https://github.com/paravmellanox/virtio-spec.git tags/for_1.4_v1

you cna just replace the same tag. No need to create a ton of
tags v1/v2 etc etc.

> for you to fetch changes up to 7384c5ee3d1efd6352c532dd7f4121fecd212a0b:
> 
>   editorial: replace hyperref with ref (2024-07-12 07:05:22 +0300)
> 
> ----------------------------------------------------------------
> This tag contains administration commands for device parts
> 
> ----------------------------------------------------------------
> Parav Pandit (6):
>       admin: Add theory of operation for device parts
>       admin: Extend resource objects for sr-iov group type
>       admin: Add admin commands for device parts
>       admin: Define common device parts
>       admin: Add requirements of device parts commands
>       editorial: replace hyperref with ref
> 
>  admin-cmds-capabilities.tex     |  16 ++
>  admin-cmds-device-parts.tex     | 469 ++++++++++++++++++++++++++++++++++++++++
>  admin-cmds-resource-objects.tex |  29 ++-
>  admin.tex                       |  12 +-
>  conformance.tex                 |   2 +
>  content.tex                     |   1 +
>  device-parts.tex                | 232 ++++++++++++++++++++
>  newdevice.tex                   |  24 +-
>  8 files changed, 778 insertions(+), 7 deletions(-)
>  create mode 100644 admin-cmds-device-parts.tex
>  create mode 100644 device-parts.tex

