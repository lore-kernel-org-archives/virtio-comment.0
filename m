Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68C0156C61
	for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 16:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716999290; cv=none; b=IwjlC0baSe3XD9od/EGaAxcopKe3XgBy8D9rrO7oxTeo1ph+I8B6f8oBSDSFOUZ1jNzJD5xd6JQKIeNfZ698qOu5BDAFD8txwJ7DyxYz0/PaidU1y5uPK5df4zySqh1R6wNKfxJKlMvL0ow1WElCW4tkwGvZ7f06UH1gzmFTRIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716999290; c=relaxed/simple;
	bh=xniP+amsftIzp/HIzpNsN5sDFJGVSSdraS4l32kfQT0=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z8oyJPSjNEwBgXKL86Rj3kU+kVkRwJlxhdUZLeJoqWFFRSAWn3UJVJXq6PBKZ6rPfwUyY8niC+mnOB7EbX7rncWK/ABTL3p67X9OTVR5oljAA9Gi6G3l//6V8oKLnFBSSog/DDbCb1ZuQNJXZD3XfZbdb950KvLI43OD5C8hogg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QJwUOJSw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QJwUOJSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716999287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eHX5MEUYy5W/+31dM37crjkUXavUNug4tMrjKkfLUok=;
	b=QJwUOJSw7IrwYaSsaUfA6fqKEiu3BcoUH5TkSGRnQ/veCpGnCKCVv5+TpAuuKwyL3dy+Yk
	04l7xnQdrULux7gydzf13612on3Pi7cGKNWXKSicyImsEcUOWVBVE6+vCdf6n3bBBQrYOW
	yuDC8B6cE1afn3lPpNmqiWmuWNwlw/U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-rawefdUEOYicDTfGUxnPMw-1; Wed, 29 May 2024 12:14:44 -0400
X-MC-Unique: rawefdUEOYicDTfGUxnPMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CA0580028D;
	Wed, 29 May 2024 16:14:44 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D173C15BB1;
	Wed, 29 May 2024 16:14:44 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, virtio-comment
 <virtio-comment@lists.linux.dev>
Subject: RE: [RFC] Process to request a vote for an issue
In-Reply-To: <PH0PR12MB5481CBA7BDC42BFC9CF56E36DCF12@PH0PR12MB5481.namprd12.prod.outlook.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <87plt6nlq4.fsf@redhat.com>
 <PH0PR12MB5481E79A58E5D2AF6ADEBE72DCF12@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87msoanjxx.fsf@redhat.com>
 <PH0PR12MB54813F8865CBD1A8F79EF510DCF12@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87jzjeni46.fsf@redhat.com>
 <PH0PR12MB5481CBA7BDC42BFC9CF56E36DCF12@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 29 May 2024 18:14:42 +0200
Message-ID: <87zfs8mw7h.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Tue, May 28 2024, Parav Pandit <parav@nvidia.com> wrote:

>> From: Cornelia Huck <cohuck@redhat.com>
>> Sent: Tuesday, May 28, 2024 7:39 PM
>> 
>> On Tue, May 28 2024, Parav Pandit <parav@nvidia.com> wrote:
>> 
>> >> From: Cornelia Huck <cohuck@redhat.com>
>> >> Sent: Tuesday, May 28, 2024 7:00 PM
>> >>
>> >> On Tue, May 28 2024, Parav Pandit <parav@nvidia.com> wrote:
>> >>
>> >> >> From: Cornelia Huck <cohuck@redhat.com>
>> >> >> Sent: Tuesday, May 28, 2024 6:21 PM
>> 
>> >> >> The last step currently mostly happens in the thread for the
>> >> >> latest revision; such an email is easily missed if you're not
>> >> >> actively following the
>> >> discussion.
>> >> >> IMHO it isn't a very reasonable expectation for the chairs to
>> >> >> follow each and every discussion in detail; at some point, it is
>> >> >> much more reasonable to expect trusted reviewers and SMEs to reach a
>> consensus.
>> 
>> Let's go back to the rationale here: Chairs should be able to find out easily
>> which issues they should open a vote on. This involves trusting that things
>> have been found reasonable by people familiar with the topic.
>> 
> Sure, however this solely is the request of the submitter to decide to ask for the vote.
> If things are not acceptable, anyway vote wont progress.
>
>> >> >>
>> >> >> Therefore, I propose that
>> >> >> - request for votes be posted in a new, separate thread, referring to
>> >> >>   the version proposed for inclusion and
>> >> > This looks good.
>> >> >
>> >> >> ideally containing a note on
>> >> >>   who deems this proposal ready for inclusion,
>> >> > This additional overhead does not seem necessary because when you
>> >> > pull
>> >> the patches using b4 tool.
>> >> > It automatically captures who has reviewed, acked those patches
>> >> > like any
>> >> other email based flow.
>> >>
>> >> I disagree: This only captures people giving their R-b or A-b; not
>> >> e.g. a SME saying "the hardware modeling looks good to me". A R-b
>> >> from a trusted virtio reviewer is obviously a good indication that
>> >> this is fine from a virtio perspective, but there's no way for Chairs
>> >> to know each and every SME and judging how valuable the R-b or A-b of
>> >> a person they do not know is. Just spell it out; "SME xyz says it
>> >> looks good" is a reasonable statement to indicate readiness for a vote.
>> >>
>> > You are trying to define two things in this one process.
>> > a. define process
>> > b. defining SMEs
>> >
>> > doing #b in this process does not look right to me.
>> > I wouldn't call it SMEs given that what you wrote above that "no way for
>> chairs to know each and every SME"..
>> > It is hard for non_chair to judge a person as SME or not. Seems broken there.
>> > Rather to keep things neutral and simple, why not just say, reviewed by or
>> acked by person xyz?
>> 
>> Again, it's not about "defining SME", I have no idea where you got this from. 
> Because you wrote the SMEs to write R-B or acked by.
>
>> I
>> just want the submitter to say "please open a vote for this,
>> $PERSON_WORKING_ON_VIRTIO and $PERSON who knows the backend are
>> happy with it." Nothing complicated, just an indication that it is reasonable to
>> open a ballot, trusting the submitter that they did any needed reviewing
>> cycles, and trusting that the people who said that it looks good did their due
>> diligence, and know what they are talking about. (Obviously, that's primarily
>> for more complex changes that touch areas that not everyone is familiar with,
>> a simple patch with an R-b does not need elaborate justifications; just use
>> some judgement.)
>
> Right. No need to attribute a person as SME or anything else.
> Person abc signed-off and person xyx reviewed/acked.
> Each information is present in last patch_N.
> Submitter to just copy paste that again in the new request vote email.
>
> TC already has voting committee to decide what to approve or not.
> Virtio TC has consciously not added any formal or informal sub-committees from last year of any intermediate SMEs.
> So, let's not complicate it now either.
>
> To your point, "Chairs should be able to find out easily which issues they should open a vote on"
>
> For any issue for which a diligent person has iterated the patches should have the right to ask for vote like today.
> Virtio TC has the ability to evaluate it and vote.
>
> If we need to discuss this more, than,
>
> Defining "process to request a vote" seems like a committee work to happen on the OASIS-virtio@ConnectedCommunity.org mailing list.
> Is virtio OASIS list still broken for you, hence discussion on this list?

Well, see my lead-in on the initial mail -- yes, it is broken (and not
just for me.)

>
> While defining the new things is good, a humble request is, lot of patches are currently in waiting stage for several weeks to months now.
> Starting with Heng's v5... and many of my patches.
> To be clear, we don't want to wait for the new process to slow down the snail further.
>
> The new steps you mentioned are good to start as long as it is not blocking patches already in the pipe.

Again, see my lead-in on the initial mail. (If things don't move once
we're good again, it's not intentional; just ping in that case.)

I'm waiting for feedback from others as well.

