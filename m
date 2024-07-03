Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133701311AC
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719995791; cv=none; b=ZfY3samie3+WqCHmPjQYotlk+/yDGZe2H0c0lXIUJuYiFw6V+MEy0OyuyLv8/G/D5zZ4fcFvWTMH/wVqm+jlMs9KCFERUE6y9n39wGL8xPSDcWV2Kv4hJ57bP67Zh6P6aSnEdT3B8xQ6Bb//zC3/AGS7yisgqN63t51BytJsOlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719995791; c=relaxed/simple;
	bh=6XZpbs9kEX0N0jO0Op0fmyoE+C9e6+U3Z1m5gg0PSAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PuDspD7AUNMr7uh/OCgvcQ7mvqQz4ZZLFbKrVgtHuAYtd/nJik6kFZgfnlJFfqSjeKjrS3jbygzz7GNHqCZJa+hymBjX+TnsA0Ly/A1upL2tKxQsoCVRC70PJQR1HjiJ7cDkx+yXDN8P8x7WoqON/1axoJTqjFp6VWzhXxSv+7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ehw80/Is; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ehw80/Is"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719995788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c8RsuHfjfxTTC717G1EtKoRERbUGVIu9rLi9U8Jt+hk=;
	b=Ehw80/Is5WKqdhQM0OzYoXSYzfU2cQJefEK7xX+owr+zZX6dfmGZfenXK9ycXws3Rqjtmb
	Ah1l0r3q7HpLvG7TPCpyvAFCW50slaLG/IAhmzZg9oDDUL3ibrbSsoxDfP80aAGMKT1uW9
	ZFE7OZlVmNBdCHvjDbiOr5OJgIV8HvQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-4EYYUDMcO8arGmp25FzEyQ-1; Wed, 03 Jul 2024 04:36:25 -0400
X-MC-Unique: 4EYYUDMcO8arGmp25FzEyQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52e9763468aso689195e87.1
        for <virtio-comment@lists.linux.dev>; Wed, 03 Jul 2024 01:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719995784; x=1720600584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8RsuHfjfxTTC717G1EtKoRERbUGVIu9rLi9U8Jt+hk=;
        b=n3SLOCX14T2YVXqBHxTYr7pFnFeA9dg92UiZExqN6ch1qV8dKXdrfb7cWKT/q9A60X
         rE7ZSqWQjzo8LbXG5QVqnO6KL152XdJ2BomeT8jZvOSdGbO45WfbirP+szQwNhAoSRgE
         qO5QI42oGYsH6L+7W90Bep9ZXWxTo24HRQMgD8Q/CVqNR7BObju88goPsUZ72RCbF/8j
         NBF8rAC8Y1Ws7ln24uQ1cXXPGZpby8XQ0jbZ83Z4O1NXg067CIK78TigZjp5wZAMFOn8
         5hWWeDSAYwWDksyk9G3ejdoTMBErx7RS9cZxE3Jro1oCMloxytWd41kiI/Vc2zwHZHeO
         Jiyw==
X-Forwarded-Encrypted: i=1; AJvYcCXIIjZtLzuDgvfzEOKHApp0SYYvYUqRhtLH0Bhg5tNQiWHZVlULQefPWh2q4TktOxSbuzsDk3/9bMH7+C0/dkqQ00Ep3Og+w/d0f472fIs=
X-Gm-Message-State: AOJu0YzW1rqVJPp7S99uluF2EgP8yLU+XK2+WhCMDDse1HI//btD34Bm
	mlBu4cmAJONj3fSgrf3mLg17qv1o+dK54XgbANRmzFB591jpoGVo5Qb4NchFddoPc8PEtnsFqtd
	IO3L2aThTyaIwTkxIlKYDdzR9G5Ggz6kIHNv2yO+Ko5yblSRW4RTaHn5U6sxElVTq
X-Received: by 2002:a05:6512:1288:b0:52c:e080:6a07 with SMTP id 2adb3069b0e04-52e82689289mr10455707e87.39.1719995783695;
        Wed, 03 Jul 2024 01:36:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHDP9q2JsZqhxc9yI5STna5kMsLGhKXGotu1qbe8N7aFJNfU0YnW/55pW60ompe0YMR1viyw==
X-Received: by 2002:a05:6512:1288:b0:52c:e080:6a07 with SMTP id 2adb3069b0e04-52e82689289mr10455671e87.39.1719995782972;
        Wed, 03 Jul 2024 01:36:22 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:91a8:a47d:5a9:c02f:92f2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab08cec4sm485941766b.152.2024.07.03.01.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 01:36:22 -0700 (PDT)
Date: Wed, 3 Jul 2024 04:36:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Lege Wang <lege.wang@jaguarmicro.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"vattunuru@marvell.com" <vattunuru@marvell.com>,
	"ndabilpuram@marvell.com" <ndabilpuram@marvell.com>,
	"parav@nvidia.com" <parav@nvidia.com>,
	Leo Liu <leo.liu@jaguarmicro.com>,
	Angus Chen <angus.chen@jaguarmicro.com>
Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Message-ID: <20240703042922-mutt-send-email-mst@kernel.org>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <CACGkMEvrHNnjdgC6Ls=YWRPFxpirCFkbf8_VnNsh-VU4NoK3tw@mail.gmail.com>
 <SI2PR06MB53850C468CF18A489A6E1ED4FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <CACGkMEtzcaUAauzpUdwjS6MEzF-suGLRv5+7cX4PeoAaqEP9hg@mail.gmail.com>
 <SI2PR06MB5385A261415EB70720DA5749FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <CACGkMEs46tCCqCcoeJ0nqOn6SRk0qqS72GSwgyt2m5p4BvNnrQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEs46tCCqCcoeJ0nqOn6SRk0qqS72GSwgyt2m5p4BvNnrQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jul 03, 2024 at 03:59:11PM +0800, Jason Wang wrote:
> On Wed, Jul 3, 2024 at 3:37 PM Lege Wang <lege.wang@jaguarmicro.com> wrote:
> >
> > hi,
> >
> > > > >
> > > > > 1) With the event index, as long as the used index doesn't pass used
> > > > > events you don't need to fetch even index every time
> > > > Yeah, I agree VIRTIO_F_EVENT_IDX could help here, but I think it's a relatively
> > > > crude mechanism, I have two questions below:
> > > >   1. Used event notification suppression structure is still located in
> > > >   host memory(in dpu case), I'm not sure whether used_event would
> > > >   be allowed to update in the running of one virtio device,
> > >
> > > What did you mean by "update" here?
> > I mean "modify".
> >
> > >
> > > >   If it's allowed,
> > > >   seems devices still need to fetch newest used_event info timely.
> > >
> > > It depends on how you define "timely", I mean unless the used event is
> > > not crossed, you don't need to fetch it from the main memory?
> > Yes, I got your point here.
> > >
> > > But basically, I meant putting used_event in a cap/register other than
> > > inventing something completely new.
> > Sorry, I don't get your point here. What does " cap/register " mean, used_event
> > Is located in main memory, right?
> 
> I meant something like this.
> 
> Introduce a capability to allow the driver to duplicate used_event in
> the register. And say when the feature is negotiated, the driver MUST
> update both used_event in the memory and the register.
> 
> Not saying it can work, but we need to know why it can't work like this.

Well I feel if you are proposing a mechanism it's up to you to
explain how it works without races.
The current notification suppression works because the read
of the notification by the device flushes out used buffer writes by
the device.
If you move it to a separate domain (such as the pci bar of the device) 
this no longer holds.


> >
> > >
> > > >   2. According to virtio-spec, for example, if used_event is 0, then a device
> > > with
> > > >   VIRTIO_F_EVENT_IDX would send a used buffer notification to the driver
> > > after
> > > >   the first buffer is used (and again after the 65536th buffer), should this
> > > behavior
> > > >   be strictly followed?
> > >
> > > Used index is best effort, and the driver must handle spurious interrupt.
> > OK, I'll discuss this info with my colleague, to see whether it could help.
> 
> Or if you found a bug in the event index, we need to fix it in the spec first.

I don't think there's a bug but it's designed to reside in same memory
as the used ring.

> >
> > > > >
> > > > > 1) compare disabling via register against memory
> > > > > 2) compare auto disable against no auto
> > > > I see, but sorry, currently we don't have any performance numbers yet,
> > > > but theoretical analysis
> > >
> > > This might be also helpful, for example, without this proposal x pci
> > > transactions per packet, with this proposal y pci transactions per
> > > packet.
> > I see, later I'll need to see if there's any performance data based on our simulation
> > environment to share.
> 
> Great.
> 
> >
> > >
> > > >  and think it'll help improve performance. Some
> > > > popular nic also supports this feature, which disables interrupt after sending
> > > > one and needs driver to enable it again. When enabling interrupt again, drivers
> > > > can attach some extra information.
> > >
> > > I'm not saying it doesn't make sense, but t
> > >
> > > 1) the movitiaton needs to be well explained
> > Totally agree.
> >
> > > 2) we need to know if the existing mechanism can be reused (e.g place
> > > used_event in a register)
> > That would be better, here the "register" you mentioned is located in a virtio device's
> > pci bar?
> 
> Something like this or other place or we can say it could be placed in
> a transport specific place.

Moving things around changes ordering rules.

> >
> > > 3) or how the new method interact with existing interrupt moderation
> > > features (event index, interrupt coalescing etc)
> >
> > Regards,
> > Xiaoguang Wang
> 
> Thanks
> 
> >
> > >
> > > >
> > > > >
> > > > > > +      The driver may benefit from just informing device the latest used
> > > > > ring entry
> > > > > > +      it has processed, but not enabling used buffer notification. This
> > > field
> > > > > only
> > > > > > +      occupies one bit, if set to 1, it will enable used buffer notification,
> > > > > otherwise not.
> > > > > > +\end{description}
> > > > >
> > > > > Any reason we can't reuse the existing meachsim like used index /
> > > > > event suppression here?
> > > > Please see my comments above.
> > > >
> > > > Regards,
> > > > Xiaoguang Wang
> > > > >
> > > > > Basically it just sounds like we need a transport specific method for
> > > > > them besides being part of the virtqueue.
> > > > >
> > > > > Thanks
> > >
> > > Thanks
> > >
> > > >
> >

