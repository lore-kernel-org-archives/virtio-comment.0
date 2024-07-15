Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D294313A889
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 08:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721033785; cv=none; b=hZ3I4AkoJVD4DkPe72rA2e/310aA6AA8zK1kD2LEMsf4o3iwB9hL54VckAAzU4CMdRUSsZalFwjzFN9sEAonMKUn34b4fmtE46QP6samgcDiu59Z1nY3RsZHQVeYrY3zapWMZsuOy+Dp5wMwbBGOFek09APyNtT25/HobjQCqzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721033785; c=relaxed/simple;
	bh=pg3NmWB6u/7OpYIp7NwTZj1Lj/wsUlrse7tnMrHQJGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ozXTyl1rxhXeS2xnVhikzn3u3YsG8kCWlk13T770xFRk0zHtllxP8/x58YXfS3bSkwWIcDmKpEgUHeT7QRapMBPE+qRsNx3pESCpuBnPJkQD4pwSxWMGIozZWbaTMLBlwnMG0+PSXSGCCP/FcBvvgWcHfUW1gSP1iCVR4TYyIno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BmVUrqB6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BmVUrqB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721033782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A0v4bYQ150MlCRi4oobqAr3GbK4JxlXz7+K6pO59gYw=;
	b=BmVUrqB6pSIxz502HjGpBWjB7pDkaHWPoHJtfa1wIRO0VLHAXSXUNAeM+JnvLllfbYmGbq
	oneazZWTPurpxTYPwqqaX+PNCzbsTp1mavjaZonmRlvMdW+fJlfYJZNAfpE2uBnd6vauDe
	CDUU1Zn55IHZa1mrSPg8m9VrkGn/Szs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-HZVjjQl-PsGDQu4DOli4PQ-1; Mon, 15 Jul 2024 04:56:18 -0400
X-MC-Unique: HZVjjQl-PsGDQu4DOli4PQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4265464ddc9so23369605e9.1
        for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 01:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033777; x=1721638577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0v4bYQ150MlCRi4oobqAr3GbK4JxlXz7+K6pO59gYw=;
        b=QQ6AsOoZQrOLO9erY3DZeTeGVR8/3FcQaxuegOvi1szjTGELBsij1pOZ6pb5dJG+BW
         O+shc5igW3zawbCdwPk8Cgx486OGW/yeObukLL5wy+x/LyhZ083fyVxvyS5rcBAjp+jB
         DHkLPRmDgU/enBF7eYiNon0nNgVVQR3qGejq3kgAkkYp/y77G7HMO4s//VC8xjVxd8Ju
         DazcRo1mePcweusS2xARpNoNE5Gbt2z8ZGIfg0WAu9LrxnnLDi2/341vkhpoJFH9aE8N
         cMAIaJ9PO1I24XYDat9MsFFrgo6migvMcONEZCa+JepT5c6mJC9OxagW33FN+i/djhRy
         ELbg==
X-Forwarded-Encrypted: i=1; AJvYcCWqQvHDm8dCt2eTxTKwGCeuQD2Qd5oxB7cbw5P6O38eo0VgXvf3cy8O06Zy/AAnZDvh0/fYoxzDErr2eWUAmK6MSa3GwQ39s6Fm1+0455M=
X-Gm-Message-State: AOJu0Yy1JZRgN18yqVCnBH7ox19TnbHxJaAS9CNtTWN7ex+xsKoKrHgd
	KaxtjWYhMBAH3jwK3pAmj7/cL9OiRnPBGj5U5HyZe1NHTyxQFU19UHi0SP09tdo4FZy1i51FqJ0
	Ws7OhX65gr6MtI9cHGWYhgTlKpN095EORoxh21tGOq9qoGooER4B/SOjD8DPT9o2s
X-Received: by 2002:a05:600c:1d16:b0:424:a401:f012 with SMTP id 5b1f17b1804b1-4279dabdf2bmr67075935e9.3.1721033777373;
        Mon, 15 Jul 2024 01:56:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcKizTv8a4d9BqHbl4b/MkpIdOEVo01dIJkr744xVdFGVrUynwZD8MWeBIHxBj2tLUZWKv3A==
X-Received: by 2002:a05:600c:1d16:b0:424:a401:f012 with SMTP id 5b1f17b1804b1-4279dabdf2bmr67075645e9.3.1721033776696;
        Mon, 15 Jul 2024 01:56:16 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:240:5146:27c:20a3:47d4:904])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef57aesm76128755e9.45.2024.07.15.01.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 01:56:16 -0700 (PDT)
Date: Mon, 15 Jul 2024 04:56:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PULL v4 ] administration commands for device parts
Message-ID: <20240715045244-mutt-send-email-mst@kernel.org>
References: <20240714150028.3292710-1-parav@vr-arch-host06.mtvr.labs.mlnx>
 <20240714115023-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481DCC7A15A54F6595AF7F0DCA02@PH0PR12MB5481.namprd12.prod.outlook.com>
 <877cdnavgn.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <877cdnavgn.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 15, 2024 at 10:52:08AM +0200, Cornelia Huck wrote:
> On Sun, Jul 14 2024, Parav Pandit <parav@nvidia.com> wrote:
> 
> > However, with commit [1], hitting below error for makediffpdf.sh and makediffhtml.sh too.
> > 	
> > HEAD is now at b495841 transport-mmio: fix up makediff from 1.2
> > Applying editorial: allow for longer device id table: makediff 1.3
> > [detached HEAD d213eb3] editorial: allow for longer device id table: makediff 1.3
> >  Author: Cornelia Huck <cohuck@redhat.com>
> >  Date: Mon Oct 30 14:42:05 2023 +0100
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > Applying admin: Prepare table for multipage listing
> > Auto-merging makediff.sh
> > CONFLICT (content): Merge conflict in makediff.sh
> > error: could not apply c69ccb2... makediff: cherry pick table env change
> > hint: After resolving the conflicts, mark them with
> > hint: "git add/rm <pathspec>", then run
> > hint: "git cherry-pick --continue".
> > hint: You can instead skip this commit with "git cherry-pick --skip".
> > hint: To abort and get back to the state before "git cherry-pick",
> > hint: run "git cherry-pick --abort".
> >
> > [1] https://github.com/oasis-tcs/virtio-spec/commit/c69ccb2f16e09e5dab9b9399b72b701d51f26b6a
> > [2] https://lore.kernel.org/virtio-comment/20240714221837.3323459-1-parav@vr-arch-host06.mtvr.labs.mlnx/T/#u
> 
> Changed line numbers probably throw it off... maybe using a different
> merge strategy for the cherry pick would make it succeed?

It's weird that it works for me - could be a different version of git.
Parav, which git version are you using? Can you try with e.g. -s patience?
Cornelia, does it work for you? Parav said he's traveling ...

-- 
MST

