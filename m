Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D362F16F830
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 14:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716905360; cv=none; b=gpiOOI8ghAQ0YP/SoCeo6fzFjHBhqhHYVQioysoop6Dpc9kmy+q/3F5Vw5+2ogKQEgQPO3DPzgm3KP15GQFFli3SjQDN4gmX3pmRBXExWo7+hSD1rSfXEh4BmpKz6suMo653QgqNBtVy3yq+waIfGLF3eQW+DU+a1UoYc3qdKlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716905360; c=relaxed/simple;
	bh=t/jZqOPXS9qSuQN3q4Zz9eFRb00b+Ufyx+JkuUHGRQY=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FazVZEt/t2NVyczDDvMTbS8W0HMI1jiC/JiNGyBrfl8/j9yfGlWRdKYScDmMQ9jSifvlWi+Nx/0VsD5bgalglJCySwC+ntJpCP4F6eWwOZocx11v8ErZGnHrU54YO16AkTfD/Ez8OWQZ6lc6k4ujqFXgn+ra3qlDuxtQQ5DqxaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fRZciGLE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fRZciGLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716905357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L2Mwv61o+/p9ay2sBWWIeYeVKkQ52QUN8MbzgEBa97Q=;
	b=fRZciGLE1N99ssCpuomz0J1Sg0oCFv1Txzr3fwbid3LMYtPjmrjrkPZyuArj/OOL0hdYu6
	UHBaXRHsSyREBcTfOG0wyYj65eAgxySqY5/x5IklSrvLlZ7ty/zrWBZV1EaIuJtJjqOuVI
	taYDODcN0rMkisk3m0gkOnIwdOyOTS4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-oNLsBrapPaCBmYObETVt0w-1; Tue, 28 May 2024 10:09:15 -0400
X-MC-Unique: oNLsBrapPaCBmYObETVt0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C83F4101A54F;
	Tue, 28 May 2024 14:09:14 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A7BF105480A;
	Tue, 28 May 2024 14:09:14 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, virtio-comment
 <virtio-comment@lists.linux.dev>
Subject: RE: [RFC] Process to request a vote for an issue
In-Reply-To: <PH0PR12MB54813F8865CBD1A8F79EF510DCF12@PH0PR12MB5481.namprd12.prod.outlook.com>
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
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 28 May 2024 16:09:13 +0200
Message-ID: <87jzjeni46.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Tue, May 28 2024, Parav Pandit <parav@nvidia.com> wrote:

>> From: Cornelia Huck <cohuck@redhat.com>
>> Sent: Tuesday, May 28, 2024 7:00 PM
>> 
>> On Tue, May 28 2024, Parav Pandit <parav@nvidia.com> wrote:
>> 
>> >> From: Cornelia Huck <cohuck@redhat.com>
>> >> Sent: Tuesday, May 28, 2024 6:21 PM

>> >> The last step currently mostly happens in the thread for the latest
>> >> revision; such an email is easily missed if you're not actively following the
>> discussion.
>> >> IMHO it isn't a very reasonable expectation for the chairs to follow
>> >> each and every discussion in detail; at some point, it is much more
>> >> reasonable to expect trusted reviewers and SMEs to reach a consensus.

Let's go back to the rationale here: Chairs should be able to find out
easily which issues they should open a vote on. This involves trusting
that things have been found reasonable by people familiar with the topic.

>> >>
>> >> Therefore, I propose that
>> >> - request for votes be posted in a new, separate thread, referring to
>> >>   the version proposed for inclusion and
>> > This looks good.
>> >
>> >> ideally containing a note on
>> >>   who deems this proposal ready for inclusion,
>> > This additional overhead does not seem necessary because when you pull
>> the patches using b4 tool.
>> > It automatically captures who has reviewed, acked those patches like any
>> other email based flow.
>> 
>> I disagree: This only captures people giving their R-b or A-b; not e.g. a SME
>> saying "the hardware modeling looks good to me". A R-b from a trusted virtio
>> reviewer is obviously a good indication that this is fine from a virtio
>> perspective, but there's no way for Chairs to know each and every SME and
>> judging how valuable the R-b or A-b of a person they do not know is. Just spell
>> it out; "SME xyz says it looks good" is a reasonable statement to indicate
>> readiness for a vote.
>>
> You are trying to define two things in this one process.
> a. define process
> b. defining SMEs
>
> doing #b in this process does not look right to me.
> I wouldn't call it SMEs given that what you wrote above that "no way for chairs to know each and every SME"..
> It is hard for non_chair to judge a person as SME or not. Seems broken there.
> Rather to keep things neutral and simple, why not just say, reviewed by or acked by person xyz?

Again, it's not about "defining SME", I have no idea where you got this
from. I just want the submitter to say "please open a vote for this,
$PERSON_WORKING_ON_VIRTIO and $PERSON who knows the backend are happy
with it." Nothing complicated, just an indication that it is reasonable
to open a ballot, trusting the submitter that they did any needed
reviewing cycles, and trusting that the people who said that it looks
good did their due diligence, and know what they are talking
about. (Obviously, that's primarily for more complex changes that touch
areas that not everyone is familiar with, a simple patch with an R-b
does not need elaborate justifications; just use some judgement.)

