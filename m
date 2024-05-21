Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0BA1422C5
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 14:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716301985; cv=none; b=RjMotCLeiwiOqj4jzdO7qOajaY2ykTL2u7M6vvC26Bb+4sL/9TnUKyi6aBmOgrJDLZr8qxlIzIm2ygz5dNGTbfpqIVkP5L2ukwyzj3uHVdZ5Yt13FA6XR8ftI6eAmrFczG/PLCcKGkHZhoH4XjTQIrWyy3tJqqMf0OHEottvr54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716301985; c=relaxed/simple;
	bh=vCfRZF4hAh+Qq/FHmDkub7Xepj5uY7PoR93fFqOorhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Y3TtpFTZXDGKnhDWcbmYNK8lJdXE6iZyxQ08Ou3r1TBuYgTmsMj+Welu1zff7G91bNL8RQJHPqRxiwAQaAen0/BLc8VVRC3XuJC+ulCu/QO6Yukc0BKeHgAOk9NjSmjcP7ut8fGepc/cZgiQraMAo/qXRR/R2xacgweTcAfb4OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KKqM6LpZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KKqM6LpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716301982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QAh8awpBK971kwhyXi5SB1+67JEWsYUl8Z9s98dr938=;
	b=KKqM6LpZyQvtS5l8qWrR7VIRKxjuU80qjbjVLIJQMwQpWcWNIE8jMYyKdCBvAMPT1smuCG
	yZvQMvUg57vHR6N0XN/opnYIxEWtpv1BbpKLIVgWq8dnlJDvXgb+w5TcUtjHxV4jzX7LY+
	nqQIfR5kz7O3o+Qfby3s6qZEPGlHbaw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-mn3d4Xx5MeKMYjubZfXXnQ-1; Tue, 21 May 2024 10:32:59 -0400
X-MC-Unique: mn3d4Xx5MeKMYjubZfXXnQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-354be050cfaso2005280f8f.1
        for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 07:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716301978; x=1716906778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAh8awpBK971kwhyXi5SB1+67JEWsYUl8Z9s98dr938=;
        b=Cq7kNO6G6l77Ehhs+LBzXvcSU7o4VahzG4nUmTsHeH+aVLDRGFZplnBmfixa+DXogJ
         dGDo8xzT2O+Rdg8pYjHtz05ZCH6nHe/UkTiCE321O1bA7sjqOHb8fHNSm8WBN7W2DoNh
         bu6sTxA+vMo89X5l0JtSMIPmymu7jjAOOCQ1hfkikjKXJFl4aUcjt3RouGlBekD6myvY
         W1BAztsj2qqW53Xnsw/TgfPIknD7In2wNUMjIDkX63J/M6f7QEYQZy7YinilFAG3DHfB
         vNHJdnMOZ4KdFhd2qeUYDcqEFKff40vOhohq1prlzKctZuGThlvHH71LDVZlr19yln4o
         /bXg==
X-Forwarded-Encrypted: i=1; AJvYcCUuHxeJB0xuh/ERK8R30SQA4Mi+0HlhDQlPcSxT1MfH+cEjwPFLpY7IhNuv34J2kq4lleyoZt2DLpMRWRRtzPwgsgwbu6fNMIMimfuA2PI=
X-Gm-Message-State: AOJu0YzpBNX4R/ZowXhIWzaho9G3XZM2xk5Zc6ZkEzVR4BMVlNTwjinf
	8gDPI5jq+ezeW0oULNgvj1Rw/wiKMkE8k3/BsnCHs3WTY1Mk2FaDr0yrT3RxQqYYn9PNAFssR7x
	Os6vT+p6j8/BMvd3X1vcYlubkQiKA4MysbP3lGdE5Gg8FfbeCT4qT8xkOBASplRwcs/h+BJ41
X-Received: by 2002:a05:6000:2a01:b0:354:ba86:39b with SMTP id ffacd0b85a97d-354ba8608a0mr6195856f8f.46.1716301978121;
        Tue, 21 May 2024 07:32:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7HhCJVUfTdt3fFCAfB7UpDb25GHo7E1DK6z05trEriWgl8SvVy69OcXXIdYrViRz+UugdJQ==
X-Received: by 2002:a05:6000:2a01:b0:354:ba86:39b with SMTP id ffacd0b85a97d-354ba8608a0mr6195832f8f.46.1716301977454;
        Tue, 21 May 2024 07:32:57 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:240:5a20:b565:3672:6f2b:3d2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bc8esm31926650f8f.15.2024.05.21.07.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:32:56 -0700 (PDT)
Date: Tue, 21 May 2024 10:32:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH v3] README.md: update mailing list info
Message-ID: <20240521103210-mutt-send-email-mst@kernel.org>
References: <20240515062910-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818853B8A407B6F2A3D463DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515063503-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A1F599028CBFAB58F594DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240521032438-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481168F6B161E51F8251992DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <874jar8p0v.fsf@redhat.com>
 <PH0PR12MB5481394675923A8A4EE3166DDCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87y18372v5.fsf@redhat.com>
 <PH0PR12MB548123CFB2F493A79CE15271DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548123CFB2F493A79CE15271DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 01:24:25PM +0000, Parav Pandit wrote:
> 
> > From: Cornelia Huck <cohuck@redhat.com>
> > Sent: Tuesday, May 21, 2024 6:13 PM
> > 
> > On Tue, May 21 2024, Parav Pandit <parav@nvidia.com> wrote:
> > 
> > >> From: Cornelia Huck <cohuck@redhat.com>
> > >> Sent: Tuesday, May 21, 2024 3:29 PM
> > >>
> > >> On Tue, May 21 2024, Parav Pandit <parav@nvidia.com> wrote:
> > >>
> > >> >> From: Michael S. Tsirkin <mst@redhat.com>
> > >> >> Sent: Tuesday, May 21, 2024 12:55 PM
> > >> >>
> > >> >> On Tue, May 21, 2024 at 04:19:31AM +0000, Parav Pandit wrote:
> > >> >> > Hi Michael,
> > >> >> >
> > >> >> > > From: Michael S. Tsirkin <mst@redhat.com>
> > >> >> > > Sent: Wednesday, May 15, 2024 4:07 PM
> > >> >> >
> > >> >> > > > > I would wait until next Monday at least. Give everyone
> > >> >> > > > > time to subscribe to the new list.
> > >> >> >
> > >> >> > Can you please merge this patch?
> > >> >>
> > >> >> Pushed now.
> > >> >
> > >> > Thanks Michael.
> > >> > Cornelia mentioned in [1] that master and 1.4 should be merged.
> > >> > 1.4 is 17 patches behind the master including this one.
> > >> > And 12 commits behind..
> > >> >
> > >> > Can you please merge them? Without it, there are conflicts in patches.
> > >> >
> > >> > Also, we need to update in the README.md on which branch to use for
> > >> sending the patches.
> > >> >
> > >> > [1]
> > >> > https://lists.oasis-open.org/archives/virtio-comment/202401/msg0008
> > >> > 7.h
> > >> > tml
> > >>
> > >> Repo status is a mess, because the state of the TC is currently a mess...
> > >>
> > >> * Before we can merge the branches, we need to do a proper Special
> > >>   Majority Vote to release 1.3 (which had been delayed since *last year*
> > >>   due to first the threatening migration, and then the actual
> > >>   troublesome migration.)
> > >> * The platform is still not working properly. For starters, we now know
> > >>   that other people besides myself are not getting any mail from the
> > >>   main TC list;
> > > Can you please follow up with OASIS?
> > 
> > Well, it's not like we've been sitting idle and not been following up...
> > 
> Sure. Not sure why I sounded that way. I am sorry about it.
> You mentioned you didn't know current status; this is why I asked if you can check the current status.
> I see your voted for #03820, so I assumed that you got the email. :)
> 
> > >
> > >> given that the ballot approving use of the new lists has
> > >>   not gotten a vote from several usually reliable voters, I fear that
> > >>   mail delivery regarding ballots is broken for some people as well...
> > >>
> > > I have followed up with OASIS for several of the members to fix their voting
> > and other broken access rights.
> > > Are you following up for the rest, or should I? Please let me know.
> > 
> > People have to tell me for me to do anything. If voting is not working,
> > please let the chairs know. I don't want to start another ballot if some
> > people are unable to participate.
> > 
> So it is working for 17 out of 19 voters as they voted in the latest ballot.
> If the person does not get any emails from OASIS main list, it is likely doesn't get the ballot email too.


No, ballots are mailed directly not through the list.

> And they wouldn't know that they were supposed to vote, until someone tells them.
> 
> This is why I asked if you want to follow up.
> I followed up with many to get their login etc sorted out.
> 
> > >
> > > To my knowledge, voting is broken for Enrico Granata based on the ballot
> > #03820 and previous ballot #184, #189 etc.
> > > Which other reliable voters are we missing?
> > >
> > >> Before requesting a Special Majority Vote, IMNSHO we need to be sure that
> > >> voters actually get notified about it. [We have raised the issues with mail
> > >> delivery with OASIS staff, but I'm really unsure about the current status.]
> > >>
> > > Can you please check the current status with OASIS?
> > > The migration by them is completed in March more than 2 months ago.
> > 
> > The migration is "finished", problems persist, OASIS has been notified
> > multiple times. I, as a chair, do not consider myself fully
> > operational. The joys of outsourcing.
> > 
> What are the missing things for you to be operational, maybe I can follow up on your behalf with OASIS?
> If that reduces your load...
> 
> > >
> > >> virtio-comment subscribers who are TC members as well: if you didn't get
> > any
> > >> emails from either the main TC mailing list (you can check the
> > >> archives) or from the voting platform, we'd like to hear about it.
> > >
> > > Contributors are not blocked anymore as the reviews have started already
> > with new list, which is good.
> > > Your previous recommendation of using the branch 1.4 for all the spec
> > patches, likely still stays the same. Right?
> > >
> > > [1] https://lists.oasis-open.org/archives/virtio-
> > comment/202401/msg00087.html
> > 
> > Yes, as long as we have not finalized 1.3, patches need to target
> > 1.4. Yes, it's a mess, and I'm highly frustrated.
> 
> Ok. got it. Thanks for the quick confirmation.

