Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E4746521
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 08:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716278641; cv=none; b=MZCU6bt0xJByZw4P7LQrALwgl+7zRUPOaF3VlZHsZ7ilsKawi/VzXo5/6cv9zNkIiXh2LoGB4Hu6utJjS/ByOrbgpr/XRMvqgAY/rVv+Bh211/LYmN9Gdd/ZN7xhPt2K5FdoKBgmZUwq7frEJQwCA635lAHiONhSPu+Bjl+TtRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716278641; c=relaxed/simple;
	bh=Vw8Ec3zuA8opCQxkuVR2LiEQgne8c53gYUN1G1XBxDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dtTV0az9Zlcz5pyplUyJpto7h8qHnZBcBNKzLXZXRsbJ501Q4Io55ycg0fL63ZLKFVnqpiWk2K9JUkzybNWsY+Nr5VA52C9k43Qq0MhtpJ3pD3Rlhuo2WQ/9u/lkBn8r0yUu9fgviEfRnvzmrtBl1Gd0O5w91UyAUr5yNvlDdig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RUbjgW1P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RUbjgW1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716278638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OP3aJVqOeNBeaglRIXCfyau6bcdGxjkZWQv9fVVRFPo=;
	b=RUbjgW1PcS+U+piu2L0dKt+oFbJV96491ckg3OVSFQ3Q/dfUYhz8Ch4awCLeSPe1DioVzt
	Stg7EBFJKtlX67V4CM31JAkLHRcm5TRjgCh0lLNIFGiaQrEHOhkf8/8qyRo0scZWBO8n1S
	FgaQLevOd1rZlKaGhjvY9SvOXat/kBs=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-QU46GbhMOG-gNKCQo7yTLg-1; Tue, 21 May 2024 04:03:57 -0400
X-MC-Unique: QU46GbhMOG-gNKCQo7yTLg-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2e2035036f5so115865351fa.0
        for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 01:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716278636; x=1716883436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP3aJVqOeNBeaglRIXCfyau6bcdGxjkZWQv9fVVRFPo=;
        b=mDZ5RH//Dv+udckapf/T333mxYEusKy7ZsPMzQ87S7xklk6kJBKXDu/4fUkvA3dsfv
         YnNbIo2lSsURaMwvvUbkpjOPd3jYeJNbBckcLfrnRPR0x9ddda04pOXpbnhMHofGi6op
         U+hoBFdPQqv785fT0Q1p0ddVQww5ozZWuFSKkUgDQTbACTkGGr2CAPfl6oaHXWEp7wno
         Itdomf/vOJQFR2dbD5G2XgET50c0Iq3eBAU96vzEw/+2MjT8+ZKjqF7YWL7uX/8GzLsd
         Wiu12Y0GIBmKiR6EzZLpLgdlnpeS6dZnC0vqiMFmFQpeGp52ftXVSwn1wVaXZH9YbUso
         vJ7Q==
X-Gm-Message-State: AOJu0YyVCF8XjiuNPCsPsRZv4Epm8bAw+/Zn2j9gX6RbwtHYERwmsiBt
	GUyJKh4fviy/ApSCN5WhRo/kdGz8qpbuuhavFS86enTsnGnb1DvfWBejrpMbtIFMWhjg5/t1Fx3
	BpAVzItlftEMTNiiWjNg1zUkaYW2vlqY3qQq8WyAG+lb7KAhv6kCjwBica9+Cr3aN
X-Received: by 2002:a2e:b889:0:b0:2da:a73:4f29 with SMTP id 38308e7fff4ca-2e51ff666b0mr362544661fa.30.1716278635857;
        Tue, 21 May 2024 01:03:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwEGnm0LNxbMMa363w0O7wyRmq7NtFUoFqMUcS1IG/8Ho8+BmxBpeT0NlVAYyFbIs5M6iP9A==
X-Received: by 2002:a2e:b889:0:b0:2da:a73:4f29 with SMTP id 38308e7fff4ca-2e51ff666b0mr362544461fa.30.1716278635292;
        Tue, 21 May 2024 01:03:55 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:240:5a20:b565:3672:6f2b:3d2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a76e6sm31186703f8f.62.2024.05.21.01.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 01:03:54 -0700 (PDT)
Date: Tue, 21 May 2024 04:03:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH v3] README.md: update mailing list info
Message-ID: <20240521040243-mutt-send-email-mst@kernel.org>
References: <8f5db33c96d685fcebca3579b05d09b64dd720d9.1715766697.git.mst@redhat.com>
 <PH0PR12MB54818B506EFE9E4ED61B4294DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515062910-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818853B8A407B6F2A3D463DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515063503-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A1F599028CBFAB58F594DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240521032438-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481168F6B161E51F8251992DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481168F6B161E51F8251992DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 07:59:03AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, May 21, 2024 12:55 PM
> > 
> > On Tue, May 21, 2024 at 04:19:31AM +0000, Parav Pandit wrote:
> > > Hi Michael,
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Wednesday, May 15, 2024 4:07 PM
> > >
> > > > > > I would wait until next Monday at least. Give everyone time to
> > > > > > subscribe to the new list.
> > >
> > > Can you please merge this patch?
> > 
> > Pushed now.
> 
> Thanks Michael.
> Cornelia mentioned in [1] that master and 1.4 should be merged.
> 1.4 is 17 patches behind the master including this one.
>
> And 12 commits behind..
> 
> Can you please merge them? Without it, there are conflicts in patches.
> 
> Also, we need to update in the README.md on which branch to use for sending the patches.
> 
> [1] https://lists.oasis-open.org/archives/virtio-comment/202401/msg00087.html

I think I'll let Cornelia do it. This patch should be cherry picked for
1.3 I think.

-- 
MST

