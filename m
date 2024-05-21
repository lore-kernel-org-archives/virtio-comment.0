Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE9C56763
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716285528; cv=none; b=DIQKEWVP+/jc60IhHIMQo82RHUVAsyt9GqHS5JNmR9Rh8JiqewUJojVwegNJfaI5ReQthspscByWLfxW5Zi4bwVCW/S5mAxztX8+/VvcT51taAICthDpanWTNor/oV9Pw8JbgwQZKuXcfP50OeXvlE9eGFge4xUKac5ZTIJ2HPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716285528; c=relaxed/simple;
	bh=rukai4ZIuym04zL/ITkaHx3jLcqnpQfYITZOFV5S3ZU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HQvoGHMeJA04KGJDAai8sUa+qGaFQK3lZbkHa625X2psRkYb13leaY42ojE7a/Dvo8dBbF0LJ2FmRLvywuVIR+Np3sLQn/iY6aHEEqWoqrlFOgaFeImmkHh0C+vRZ2C24k9hIPvk/dnr4NjF1PiZE9P9nojyV64R4MuGM/t7bBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iA+dLiut; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iA+dLiut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716285525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K7tyY9qnGA57YnisgvGJbEQle01h1tAz0HF2oZwj218=;
	b=iA+dLiutEbnl/t1JGXHo7fEWFLEHDk6iSoY1Q7bw/vR7D4cAKQpy/mkQi+Yx58eAMCN5a5
	accUIILLoRh2XOo4lLO2sirBnkApp0G9/yegkfm391e8UvX6/R3+uqK7QZmPg/sYW4gqpb
	GYSnbeFNLW/QTG1mmBT8Rec8VQwGqbs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-4Q6yCFIkMweHOhyH4NqYmA-1; Tue, 21 May 2024 05:58:42 -0400
X-MC-Unique: 4Q6yCFIkMweHOhyH4NqYmA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1205B8058D1;
	Tue, 21 May 2024 09:58:42 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9676640B90E;
	Tue, 21 May 2024 09:58:41 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v3] README.md: update mailing list info
In-Reply-To: <PH0PR12MB5481168F6B161E51F8251992DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <8f5db33c96d685fcebca3579b05d09b64dd720d9.1715766697.git.mst@redhat.com>
 <PH0PR12MB54818B506EFE9E4ED61B4294DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515062910-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818853B8A407B6F2A3D463DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515063503-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A1F599028CBFAB58F594DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240521032438-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481168F6B161E51F8251992DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 21 May 2024 11:58:40 +0200
Message-ID: <874jar8p0v.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Tue, May 21 2024, Parav Pandit <parav@nvidia.com> wrote:

>> From: Michael S. Tsirkin <mst@redhat.com>
>> Sent: Tuesday, May 21, 2024 12:55 PM
>> 
>> On Tue, May 21, 2024 at 04:19:31AM +0000, Parav Pandit wrote:
>> > Hi Michael,
>> >
>> > > From: Michael S. Tsirkin <mst@redhat.com>
>> > > Sent: Wednesday, May 15, 2024 4:07 PM
>> >
>> > > > > I would wait until next Monday at least. Give everyone time to
>> > > > > subscribe to the new list.
>> >
>> > Can you please merge this patch?
>> 
>> Pushed now.
>
> Thanks Michael.
> Cornelia mentioned in [1] that master and 1.4 should be merged.
> 1.4 is 17 patches behind the master including this one.
> And 12 commits behind..
>
> Can you please merge them? Without it, there are conflicts in patches.
>
> Also, we need to update in the README.md on which branch to use for sending the patches.
>
> [1] https://lists.oasis-open.org/archives/virtio-comment/202401/msg00087.html

Repo status is a mess, because the state of the TC is currently a
mess...

* Before we can merge the branches, we need to do a proper Special
  Majority Vote to release 1.3 (which had been delayed since *last year*
  due to first the threatening migration, and then the actual
  troublesome migration.)
* The platform is still not working properly. For starters, we now know
  that other people besides myself are not getting any mail from the
  main TC list; given that the ballot approving use of the new lists has
  not gotten a vote from several usually reliable voters, I fear that
  mail delivery regarding ballots is broken for some people as well...

Before requesting a Special Majority Vote, IMNSHO we need to be sure
that voters actually get notified about it. [We have raised the issues
with mail delivery with OASIS staff, but I'm really unsure about the
current status.]

virtio-comment subscribers who are TC members as well: if you didn't get
any emails from either the main TC mailing list (you can check the
archives) or from the voting platform, we'd like to hear about it.

