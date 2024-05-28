Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B8C16E89E
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716902993; cv=none; b=LZ6QUlA2PfTrgzaC0eUiBmyUpgzbCKoiVk2FJtgy2I4KVI2sZuUoswRxuUiINTKelqZpAV+QVj6ryxppAmYg/L3bSCw/nuH3RZDGQzjMaMPoQyV3J4nTOXI9YSEdITeJ7Y12sTGh3mhBXEMT4k1cZLonQBsTGiH35dilPV+zCw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716902993; c=relaxed/simple;
	bh=fomsutELISf4JOabRS3xDo2fQqA3hPcSVW1h0BgvZAg=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LiUZZADTjD3h2ZF0cfTS3Py5uHfqfXnR7a1JBGkNbGbkZgUUFJ+1QajY7QfYIETWohk41fRvwglVeT4ygtaR/fjx34AvCbgOMZgmDaKGU9m0KQ1/fz/mIqtN8TQDZyUMtM5P1f+UKbc6Y9jIw7GKxtbwUeQaul3ISr5AcFjqg4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FbkB9Gjq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FbkB9Gjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716902990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mUxrOxCr01p4ib5PKG4wISKVObJ430lPBPzga3xnAA8=;
	b=FbkB9GjqZyo/FdjGKUjJWiqVNo8FD2JluibxQYGGFV784lmQCLUsxYSTfbF+tp2j49h2lS
	3gOjIs0QeNfcia1+/CFq8mxKPgf5L4LQet4VZY2jpNBEJSoSSHqnR2bTqctCZW2ZPzq4bi
	05BxyfxsKwY/+FTJASJ7G/p4zJ+ha3k=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-486-fGRX3ImNOIaBCKK-PKdDMA-1; Tue,
 28 May 2024 09:29:48 -0400
X-MC-Unique: fGRX3ImNOIaBCKK-PKdDMA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15A7E1C0512D;
	Tue, 28 May 2024 13:29:48 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3850492BC6;
	Tue, 28 May 2024 13:29:47 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, virtio-comment
 <virtio-comment@lists.linux.dev>
Subject: RE: [RFC] Process to request a vote for an issue
In-Reply-To: <PH0PR12MB5481E79A58E5D2AF6ADEBE72DCF12@PH0PR12MB5481.namprd12.prod.outlook.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <87plt6nlq4.fsf@redhat.com>
 <PH0PR12MB5481E79A58E5D2AF6ADEBE72DCF12@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 28 May 2024 15:29:46 +0200
Message-ID: <87msoanjxx.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Tue, May 28 2024, Parav Pandit <parav@nvidia.com> wrote:

>> From: Cornelia Huck <cohuck@redhat.com>
>> Sent: Tuesday, May 28, 2024 6:21 PM
>> 
>> [first of all: there are still issues with our usage of the platform...]
>> 
>> [Also, first discussing this on virtio-comment, as this is (a) where people who
>> want to submit changes usually are subscribed, and (b) an actually working
>> list, unlike the list for the TC...]
>> 
>> The current process to include an update in the spec is something like the
>> following:
>> - open a github issue
>> - post a patch on the list, link it from the issue
>>   - iterate through some review cycles
>> - ask for a vote, so that the Chairs will open a ballot
>> 
>> The last step currently mostly happens in the thread for the latest revision;
>> such an email is easily missed if you're not actively following the discussion.
>> IMHO it isn't a very reasonable expectation for the chairs to follow each and
>> every discussion in detail; at some point, it is much more reasonable to expect
>> trusted reviewers and SMEs to reach a consensus.
>> 
>> Therefore, I propose that
>> - request for votes be posted in a new, separate thread, referring to
>>   the version proposed for inclusion and 
> This looks good.
>
>> ideally containing a note on
>>   who deems this proposal ready for inclusion,
> This additional overhead does not seem necessary because when you pull the patches using b4 tool.
> It automatically captures who has reviewed, acked those patches like any other email based flow.

I disagree: This only captures people giving their R-b or A-b; not
e.g. a SME saying "the hardware modeling looks good to me". A R-b from a
trusted virtio reviewer is obviously a good indication that this is fine
from a virtio perspective, but there's no way for Chairs to know each
and every SME and judging how valuable the R-b or A-b of a person they
do not know is. Just spell it out; "SME xyz says it looks good" is a
reasonable statement to indicate readiness for a vote.

>
>> - and those requests be clearly marked in the subject, for example with
>>   a "[Request for vote]" prefix that can be easily filtered for.
>> 
> This flow described here got to be present on the README.md and if possible at [1] too.
>
> With reworking the section [2] and [3] to write above text.

Well, after we have agreed on something.

