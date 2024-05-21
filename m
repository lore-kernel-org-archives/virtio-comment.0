Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F08A74C08
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716293237; cv=none; b=edTMn1QlXN1WVFBbe2GTZYx5z9zzFedZyt9owjyuHyzTTNbRO7rAOJrSTEEYwzq+bdMP6U8KDJLr36y2n73Re9v1DoFQY+cIp58fHFxzun7cFCVk8R0tE3vGyozA9V8tLNidFw+6YWimvlGQl1gK9zbRNtAxLQb96dPMnUY+yCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716293237; c=relaxed/simple;
	bh=8yflEgci9RJ1rEuokIHgvnSsc0r7dWfYfr9NrhLa9JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Qw0A8NA5zmGbxhJOZJ9kD/0QJROwldBQdiacUTACn0z5TH1i3Y0rFFsEaDiAKfHW/w6mxnRbG9mMfqwfCYUFuIeDWJC7eSHADzbZTBmOYp43qHFSjjGFAG/e3Phh2M9BzoNW8jy7CbM+B48BKu11TbjaO3n1Lwoo0YDeMoFjFKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bMFtlKpJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bMFtlKpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716293234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vNxtef7wVSAKAp/uYMVVrJVX9c61BxExImvyppOpLhY=;
	b=bMFtlKpJ26J7oU99EQ13eVSUofB7xr7BL6KejULtweluesRbuQlYRshd0RX+spLIxU3HlB
	Hj4kdSQPGHACkc7TIYZaL6JJPpy7VM8HXoEvxCqbw72Xnw5R0KS+Hf4C2ZQ9rlrtIHjNOr
	lRSMKgxsZijZ7jMqYBKxqhNnlWsox/M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-BDC2FJgDPhaOcFbQ7jVXlQ-1; Tue, 21 May 2024 08:07:13 -0400
X-MC-Unique: BDC2FJgDPhaOcFbQ7jVXlQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-34f10f6b3aeso8667904f8f.3
        for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 05:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716293232; x=1716898032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNxtef7wVSAKAp/uYMVVrJVX9c61BxExImvyppOpLhY=;
        b=mjuHLbOsvVdM4fRlq8nZafqZEhbzhZp7DYR1dQHzHec5yvS3qwbWVRyZ3rfO2Vx8mz
         Uikchr3tXnaZR/FxLcc/hqUkYhxAGX/vHMZUADudGMP7YRIjoZUwWoDyjuWI0xh4K+R5
         6JuFwpATqnjSEGXb2IEGas0yluN5a083J9K0eM8CvZQOlozh1Tm52Re/LZxX8JR5Q+ql
         lKEGbbW1vj4B1ry1cCDXgpOi7JUJywQZX2Cn/KyfUP+by+qZLMkwPSOOlb122XF8Wdch
         /2sE7pUcdnQAOZtfGUmrQaDHg/GrAWgWf8+hTed+1Mxh22B1sa87vn/fdzp5O6Ir/bpP
         /6qw==
X-Forwarded-Encrypted: i=1; AJvYcCVdAQrjR8SolEP7szR2Cer5Axj6tnwbcRl4bXPk7f7Dz+5kaqXsEy9ZLfJQ5nUK1st5zggdTCPoMEOToSMyhc3d6NT71S/PQryowrWWBy4=
X-Gm-Message-State: AOJu0YwEAeK86e2veDhE7UKn6LCTxK58ZyGbWM4bxAD4Z9idzfC2kHiK
	S25XuJc/RkqQ26kI/pFiRiPNXeD781Jb9ZNT9ln7Xu5pMbAgYrINfwrjqdUDt4EjsaEk8e/d5Vp
	eAFRb29j1IlvvZEDnn7uBMcgL1nY4uyiy7LNvYIpQH2CTs5xK5c08B0BBSMMvW61d
X-Received: by 2002:adf:ff92:0:b0:34d:a31d:e316 with SMTP id ffacd0b85a97d-3504a736476mr20601613f8f.22.1716293231921;
        Tue, 21 May 2024 05:07:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFUahIQG8iExe/NyA1ATbYGcX2scwRQQ5xzDHUNLuHHW6oZBB0hbbUOa8DjWQJhm+X7a/RhA==
X-Received: by 2002:adf:ff92:0:b0:34d:a31d:e316 with SMTP id ffacd0b85a97d-3504a736476mr20601595f8f.22.1716293231351;
        Tue, 21 May 2024 05:07:11 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:240:5a20:b565:3672:6f2b:3d2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b895887sm31684481f8f.40.2024.05.21.05.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 05:07:10 -0700 (PDT)
Date: Tue, 21 May 2024 08:07:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH v3] README.md: update mailing list info
Message-ID: <20240521080424-mutt-send-email-mst@kernel.org>
References: <8f5db33c96d685fcebca3579b05d09b64dd720d9.1715766697.git.mst@redhat.com>
 <PH0PR12MB54818B506EFE9E4ED61B4294DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515062910-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818853B8A407B6F2A3D463DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515063503-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A1F599028CBFAB58F594DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240521032438-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481168F6B161E51F8251992DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <874jar8p0v.fsf@redhat.com>
 <PH0PR12MB5481394675923A8A4EE3166DDCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481394675923A8A4EE3166DDCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 12:02:13PM +0000, Parav Pandit wrote:
> 
> > From: Cornelia Huck <cohuck@redhat.com>
> > Sent: Tuesday, May 21, 2024 3:29 PM
> > 
> > On Tue, May 21 2024, Parav Pandit <parav@nvidia.com> wrote:
> > 
> > >> From: Michael S. Tsirkin <mst@redhat.com>
> > >> Sent: Tuesday, May 21, 2024 12:55 PM
> > >>
> > >> On Tue, May 21, 2024 at 04:19:31AM +0000, Parav Pandit wrote:
> > >> > Hi Michael,
> > >> >
> > >> > > From: Michael S. Tsirkin <mst@redhat.com>
> > >> > > Sent: Wednesday, May 15, 2024 4:07 PM
> > >> >
> > >> > > > > I would wait until next Monday at least. Give everyone time
> > >> > > > > to subscribe to the new list.
> > >> >
> > >> > Can you please merge this patch?
> > >>
> > >> Pushed now.
> > >
> > > Thanks Michael.
> > > Cornelia mentioned in [1] that master and 1.4 should be merged.
> > > 1.4 is 17 patches behind the master including this one.
> > > And 12 commits behind..
> > >
> > > Can you please merge them? Without it, there are conflicts in patches.
> > >
> > > Also, we need to update in the README.md on which branch to use for
> > sending the patches.
> > >
> > > [1]
> > > https://lists.oasis-open.org/archives/virtio-comment/202401/msg00087.h
> > > tml
> > 
> > Repo status is a mess, because the state of the TC is currently a mess...
> > 
> > * Before we can merge the branches, we need to do a proper Special
> >   Majority Vote to release 1.3 (which had been delayed since *last year*
> >   due to first the threatening migration, and then the actual
> >   troublesome migration.)
> > * The platform is still not working properly. For starters, we now know
> >   that other people besides myself are not getting any mail from the
> >   main TC list; 
> Can you please follow up with OASIS?
>
> > given that the ballot approving use of the new lists has
> >   not gotten a vote from several usually reliable voters, I fear that
> >   mail delivery regarding ballots is broken for some people as well...
> > 
> I have followed up with OASIS for several of the members to fix their voting and other broken access rights.
> Are you following up for the rest, or should I? Please let me know.
> 
> To my knowledge, voting is broken for Enrico Granata based on the ballot #03820 and previous ballot #184, #189 etc.
> Which other reliable voters are we missing?
> 
> > Before requesting a Special Majority Vote, IMNSHO we need to be sure that
> > voters actually get notified about it. [We have raised the issues with mail
> > delivery with OASIS staff, but I'm really unsure about the current status.]

voters actually get notified directly.

> Can you please check the current status with OASIS?
> The migration by them is completed in March more than 2 months ago.
> 
> > virtio-comment subscribers who are TC members as well: if you didn't get any
> > emails from either the main TC mailing list (you can check the
> > archives) or from the voting platform, we'd like to hear about it.
> 
> Contributors are not blocked anymore as the reviews have started already with new list, which is good.
> Your previous recommendation of using the branch 1.4 for all the spec patches, likely still stays the same. Right?
> 
> [1] https://lists.oasis-open.org/archives/virtio-comment/202401/msg00087.html

