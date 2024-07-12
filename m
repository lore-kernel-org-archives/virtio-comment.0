Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824D47EF09
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720781273; cv=none; b=ll5e2/QsW3E5NL2hve+AXIVYTwzuE0VpyC9HynvAiube6dd0P1X6ZsdnGZVph/Q1oB9fzcXVPF8BDbWwCJA1teFCzwN5wZOEE3vg0PZhlG/kDsdHYxJYUKdykBucrUXeZ2PAxesTI1sNP795OHbszSRMY3NDlo30yNH6nKIHJPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720781273; c=relaxed/simple;
	bh=9Tjjx550tcffqSzRk6h33SHCeQNPTxR08ofFIaZWEV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gLdJ2gTkdVgVQ+D8u2M28zUUNlRzSBVDyCol/2pa9cCiTxnjt1YBDkX1ZMIsH5iz5uUF87JFih3Gt+/fbJVpcWDN9HVp1ywRhzyRiIWvuS0kplcCTIwQHM+LGZ2nKC3KgHoTgwduPEJ7S12qNnobHT1a8VB3Uwv82Ib3/Faql6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EiXq9dXs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EiXq9dXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720781270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=erfJ0BDkfWMK3/z2kVkz/YzYKnqJA+q2WVd1TubBUSE=;
	b=EiXq9dXsFeq0kgSMA8gr8zHmvOwY2Mi6D9OmrZKduKPrZN8pO2UK5naVNxmhHLSr9pPjjt
	FGkAxAd8myRwktkns+nhqk4unyqO96QdzELvDgxCPfoVHso6kWmJeXaFKKClUpS9EHSNZi
	5P90mYpjuujqfLOS/g3OwoPf9STsZQs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-7eZ5rDEDOJCmVOeDKjFW3w-1; Fri, 12 Jul 2024 06:47:49 -0400
X-MC-Unique: 7eZ5rDEDOJCmVOeDKjFW3w-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-367a3052cfaso1574329f8f.0
        for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 03:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720781268; x=1721386068;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=erfJ0BDkfWMK3/z2kVkz/YzYKnqJA+q2WVd1TubBUSE=;
        b=jJtGLT77jI23sswfCzGyf+QQ9kvnjZgFTp3N3DbDsmSuIiPrQs6yKS/i334iQ9l1Gi
         uQGE1rHIbt1t0GG4vqI9LQQK+twlPveqieIbIdXNEsqxcyN2uhhkvc/QypBm+we/IJN+
         GoO5szIsBppuOzpqkofLFlfcp0YC45QGrWX4A5cWeB9IRsaMR+/7BiqRTMiQ1dI0Ecw6
         lvPCanDzxxF2lzLd9dtoE6AkdvtAkXXsqzk0Jqz8La4keM5iEG1+VXyrrnFoTjlfC4nz
         gM5yd70vJF+tHWYRADZ+i7BZBwlzYCRlMNt0iNXxu6/T04tggqTpHkhf2eKxgYv9Fhpr
         Ysqg==
X-Forwarded-Encrypted: i=1; AJvYcCVQq/9mwE7iNJpNbyY7eQ5lFA71Xh+hs2olwYo44uc5EhEOIPQiQU4xkweKnyRgFXiSAdKUAShDbDVPAsvI4cWjmq79pitB5E/tJESJmDs=
X-Gm-Message-State: AOJu0Ywl7lTgj72h1mzVoMuvdpyXOgI3kiPmsUgyQIetj1ApfYVDtekI
	hs0Mw4dOf1/kinZz0WSBD1lC7sUUoiJyhklaQlojHLq/f8IHWvL47m5emBoY5QTMqBJ76i/R1Zi
	Bm8MLCs6YPpopUkKw9saDMgft3fXiopx/slUkyRdxQJivDKymeo8peDHlPys/37/y
X-Received: by 2002:a5d:47a7:0:b0:360:75b1:77fb with SMTP id ffacd0b85a97d-367cea46438mr12236223f8f.8.1720781267900;
        Fri, 12 Jul 2024 03:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyNexu7NusCeaprmL4YSwWwD7lXvETSyJDG/Pvhnessy9YAbV2wEFdn9HqfIECWqsdy24M8A==
X-Received: by 2002:a5d:47a7:0:b0:360:75b1:77fb with SMTP id ffacd0b85a97d-367cea46438mr12236201f8f.8.1720781267351;
        Fri, 12 Jul 2024 03:47:47 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:761e:f82:fc9a:623b:3fd1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7df3dsm9887376f8f.16.2024.07.12.03.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 03:47:46 -0700 (PDT)
Date: Fri, 12 Jul 2024 06:47:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Parav Pandit <pandit.parav@gmail.com>, virtio-comment@lists.linux.dev,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [GIT PULL virtio 00/40] virtio master branch with fixes and
 admin commands
Message-ID: <20240712064201-mutt-send-email-mst@kernel.org>
References: <20240711202352.3228345-1-parav@nvidia.com>
 <87o772c2x9.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87o772c2x9.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jul 12, 2024 at 12:36:34PM +0200, Cornelia Huck wrote:
> On Thu, Jul 11 2024, Parav Pandit <pandit.parav@gmail.com> wrote:
> 
> > Hi Michael, Cornelia,
> >
> > The following changes since commit 37c6a406678a5ee891fdf5671298cb4fcfa517f2:
> >
> >   sound: add sampling rates 12000Hz and 24000Hz (2024-02-16 11:55:25 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/paravmellanox/virtio-spec.git tags/for_1.4
> >
> > for you to fetch changes up to 74bf759aef3bf10447aadcb841c66dc5e6a578d6:
> >
> >   virtio_pci_cap64: specify offset_hi, length_hi endianness (2024-07-11 20:54:20 +0300)
> >
> > ----------------------------------------------------------------
> > This tag contains virtio master branch and set of patches of administration commands, pci fix, blk config fix, and net description fixes
> >
> > - editorial changes froom master branch
> > - virtio blk and pci capabilities data type fixes
> > - virtio net header description update
> > - adminstration commands for flow filters
> > - administration commands for device parts
> >
> > Generated PDF and also the diff pdf were verified using makepdf.sh, makediffall.sh and makediffpdf.sh.
> >
> > ----------------------------------------------------------------
> > Cornelia Huck (12):
> >       edit: remove old changelog
> >       edit: add changelog for 1.3
> >       acknowledgements: update for 1.3
> >       editorial: update copyright date in PDF footer to 2023
> >       change revisions: diff from v1.2, current v1.3
> >       title: note that 1.3 supercedes 1.2
> >       revision: update date
> >       remove enumerate usage that makes the tool unhappy
> >       Revert "remove enumerate usage that makes the tool unhappy"
> >       editorial: various fixes for 1.3-csd01
> >       editorial: update "Computer Language Definitions" URL
> >       makediff: update list of cherry-picks
> >
> > Kröning (1):
> >       virtio_pci_cap64: specify offset_hi, length_hi endianness
> 
> Hm, something bad happened to the author field here (script confused?)
> Not fixable without a force push, though :(

Indeed.
I did a force push.
Parav, you will have to rebase your pull request, sorry.

-- 
MST

