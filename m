Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D764317164
	for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776871092; cv=none; b=c0PiHSgq2fmS1+mpxVQCEOckgsPEfBLQZE8t/Ze5cqw8z3ea93KONqHKy+8OHWj/32jVKg8szjawolC+hUAMYzdn+WCR/5lJA5dl77xEJqB1g8u/DVzjVU2vddW2I+uV1oDLct7JQ5/b5qiacuqEFm4X/AOCabFuLzNY22hHCaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776871092; c=relaxed/simple;
	bh=7K33OWV0oDGEWVjCNVOZzVwtAs0VEvpqefLjZAKczis=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m33cJ2Us3TRfW/U9l8REoNpLWF9RvdiIB/gyPf1cxA/Hf6BQrt8q/9JJZ0xqoUdoOgJXkLPO7hdKzrgQNbsMAWvkCo1hlMFPvwR3iB2g9Oth7QknFV4b9N8PEUv2W5U3cQ25gud+U3VO14jRYEGpjBCA1hUOWG1lyPNCp2BziAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J4JSem1x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J4JSem1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776871090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7K33OWV0oDGEWVjCNVOZzVwtAs0VEvpqefLjZAKczis=;
	b=J4JSem1xAsMoCzZrR6Izo5+0pF4xilJNV+pkwWjrkuGGEIGRwmUm2xrxY6VNbsHPhq9UH4
	qyZeL21bR+z4/beDUR/CPb2pdE/A2cCZBbixjRSkZctI6O2muNXHvQsI0MozeJbEHo1Vy/
	rECHdj8QmmE35liwhBGpROMtXby3ugo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-142-IS28-wtfN6mdqk10rKqTgA-1; Wed,
 22 Apr 2026 11:18:06 -0400
X-MC-Unique: IS28-wtfN6mdqk10rKqTgA-1
X-Mimecast-MFC-AGG-ID: IS28-wtfN6mdqk10rKqTgA_1776871086
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DC9B0180036E;
	Wed, 22 Apr 2026 15:18:05 +0000 (UTC)
Received: from localhost (dhcp-192-224.str.redhat.com [10.33.192.224])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 41EF7180058B;
	Wed, 22 Apr 2026 15:18:04 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>
Cc: virtio-comment <virtio-comment@lists.linux.dev>
Subject: Re: #virtio IRC channel on OFTC
In-Reply-To: <206F0630-B109-45C5-9E06-E85ED3D28A6F@arm.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <CAAjaMXZHoHwA7sWkZYE0ANah0vwRWtEUYLvc8ULxm5-jggGeYg@mail.gmail.com>
 <206F0630-B109-45C5-9E06-E85ED3D28A6F@arm.com>
User-Agent: Notmuch/0.39 (https://notmuchmail.org)
Date: Wed, 22 Apr 2026 17:18:02 +0200
Message-ID: <87v7djrplh.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ceKTbAHzqqKmj0qgDrOLwgfQBH7EMWrRY4xEwgD_vvI_1776871086
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Wed, Apr 22 2026, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:

> Hi Manos,
>
>> On 22 Apr 2026, at 15:49, Manos Pitsidianakis <manos.pitsidianakis@linaro.org> wrote:
>>
>> Hi VIRTIO TC members, stakeholders, interested parties,
>>
>> I took the initiative to register #virtio channel on the OFTC IRC
>> network for general, unofficial/informal discussion, since most of us
>> idle on linux related IRC channels anyway. I invite you to join (you
>> can also join via Matrix if you don't use IRC)
>>
>> If a VIRTIO TC member joins I can transfer registration of the channel
>> to their nickname and give them operator rights.
>
> This is a good idea to have a way to communicate like this but I am not sure IRC is the best solution.
> Couldn't we create some google chat or something like that ?
> I can access matrix channels for example but IRC will be more challenging.

You should be able to join #virtio via matrix (I just did, so the
bridging should work.)

