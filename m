Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351BA156672
	for <virtio-comment@lists.linux.dev>; Fri, 31 May 2024 11:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717153442; cv=none; b=MyiboVUJXBnpJN2o9D64h9GDrqupdkYF5J7SbB96cZ0QjSMnfsfw6lNNLiiJUFS4d+QoFryEBwWzKwFtGTvugRzDGQCEVqFh8HdNILNZqj6gZSH5KS83KCKFQyO1raeY2aA5qjfQkxFlkbNubm71EREDEaT1c3AdxobJE4uLJpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717153442; c=relaxed/simple;
	bh=YTVDVolCyVCIecxWlVhh79NKhqXwpwqE8WjiAWvw8cY=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ALJXpFVtPOs8a/Db/AKMFa6B4Rkr7NToLVDvgdIQ9BMhJCsunFnyISniOTTHNUi7c+APTk91umPlafdCo0rEbsCZ90BrTH8ay9zTZVelNgh6+kbH9F4fSebFOh/zlQ+PBZfBMFN8ctnq7Wt/0NqQSIxsiBHi+KS5QZUuQtuQ+KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QX0X7S6Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QX0X7S6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717153439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7zaavmF/kfP6q+faldz/skQm4yel9qDrbqhH64S+qZI=;
	b=QX0X7S6YxhcqUw06w8IdO02wy11FBK79jVz/GH6H1FQZZNtRXMvQ7cpbCCJaA7iikFOF3n
	ywQMJPMU2v7/e+60cAGS3L9x0AupiI5FJxXROd12v8OozGU/y57MK7qQmutjxxh6RNZEaJ
	LFJyLX+cIXQ2vkzHSFG+GaJW/XXPZ4k=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-wDo6f4itNu6QgRcoix_Lmg-1; Fri,
 31 May 2024 07:03:57 -0400
X-MC-Unique: wDo6f4itNu6QgRcoix_Lmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C289A29AA381;
	Fri, 31 May 2024 11:03:56 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 897463C27;
	Fri, 31 May 2024 11:03:56 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alexander Gordeev <alexander.gordeev@opensynergy.com>, virtio-comment
 <virtio-comment@lists.linux.dev>
Subject: Re: [RFC] Process to request a vote for an issue
In-Reply-To: <b833b3f6-fad6-44a0-a67e-f1cedeeba03b@opensynergy.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <87plt6nlq4.fsf@redhat.com>
 <b833b3f6-fad6-44a0-a67e-f1cedeeba03b@opensynergy.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 31 May 2024 13:03:55 +0200
Message-ID: <87ikyumeec.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Fri, May 31 2024, Alexander Gordeev <alexander.gordeev@opensynergy.com> wrote:

> Hi Cornelia,
>
> On 28.05.24 14:51, Cornelia Huck wrote:
>> [first of all: there are still issues with our usage of the platform...]
>> 
>> [Also, first discussing this on virtio-comment, as this is (a) where
>> people who want to submit changes usually are subscribed, and (b) an
>> actually working list, unlike the list for the TC...]
>> 
>> The current process to include an update in the spec is something like
>> the following:
>> - open a github issue
>> - post a patch on the list, link it from the issue
>>    - iterate through some review cycles
>> - ask for a vote, so that the Chairs will open a ballot
>> 
>> The last step currently mostly happens in the thread for the latest
>> revision; such an email is easily missed if you're not actively
>> following the discussion. IMHO it isn't a very reasonable expectation
>> for the chairs to follow each and every discussion in detail; at some
>> point, it is much more reasonable to expect trusted reviewers and SMEs
>> to reach a consensus.
>> 
>> Therefore, I propose that
>> - request for votes be posted in a new, separate thread, referring to
>>    the version proposed for inclusion and ideally containing a note on
>>    who deems this proposal ready for inclusion,
>> - and those requests be clearly marked in the subject, for example with
>>    a "[Request for vote]" prefix that can be easily filtered for.
>> 
>> Thoughts, comments?
>
> Could you please specify who an SME is? Does this stand for the Society 
> of Manufacturing Engineers (sme.org)?
> I tried to search the virtio-comment and virtio-dev archives, but 
> couldn't find anything relevant:
> https://lore.kernel.org/virtio-comment/?q=SME
> https://lore.kernel.org/virtio-dev/?q=SME
> Also not in the spec repository.

SME == Subject Matter Expert

I was simply trying to describe the reality: we have people familiar
with virtio and the spec, and we have people familiar with with
technologies, and in the ideal case, we'd have both agree on a change
(can obviously be one person, if they're familiar with both :)

/me thinks she should never have brought that up and thought that was a
very common TLA :(

