Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FE14AEF4
	for <virtio-comment@lists.linux.dev>; Fri, 19 Jul 2024 08:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721378772; cv=none; b=l0WVHHkpuwdNlkX/r4DzM65inhkyGrOZYjdHKFc9EkuSwhszfbzyjwaML++y4H4YTzKl6NYR1zz5jmeWKoRhQL6bOHVfnzGd33hceQtrjxvQYPighICXO1Nee/K8W2jHiLhmRuiEeJrfDKMinf1AFMQt3Jz90/CEyDz6/kgh8sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721378772; c=relaxed/simple;
	bh=yi9qD9ITy7TRAGwQBfBwW/UQe4VlfgTJZlsohvSMSjw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lST88/yTVVU0av692knejKuqbrSiFEijaxqdZuNQrqAZQr/GvMTq5o5yyvyc+TM4p5YGAqCxgybkwlehTgoX5r/pBZzld4rdYs+Avb1Cp41aLj7urldQDz/uwhJQs20CYI8kSdZvgxNM50UGxr+Y1QayAgp/Kx0kKo/T/fnusXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YGCY2rMS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YGCY2rMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721378766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yi9qD9ITy7TRAGwQBfBwW/UQe4VlfgTJZlsohvSMSjw=;
	b=YGCY2rMSeiPPqD1F96Ria9aAOLfTlGyaoPgnexSQngqbngR1QIiB1vBRO4QiQ5Re4eoiVw
	oNsfyagy2ibywPzDxbLtQVpLSDlaYHKP2bKBhU5KqG5zMwmfoaUUm75+GAkWSW1JowoOnj
	sM2I+CJfGs5IpyD45Kl70KLPygjNHw4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-633-d5npoIctNLyKtF0U_760Gg-1; Fri,
 19 Jul 2024 04:46:01 -0400
X-MC-Unique: d5npoIctNLyKtF0U_760Gg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C0E61955BF1;
	Fri, 19 Jul 2024 08:46:00 +0000 (UTC)
Received: from localhost (dhcp-192-210.str.redhat.com [10.33.192.210])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E967E1955E80;
	Fri, 19 Jul 2024 08:45:58 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: Request voting rights
In-Reply-To: <45f9408e-5e7d-4e20-b20b-2fecd986986f@amd.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <1f4e0199-ba54-44b1-a060-91acb002bb62@amd.com>
 <aa5e581b-a8a5-4196-b274-79887242734b@amd.com>
 <45f9408e-5e7d-4e20-b20b-2fecd986986f@amd.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 19 Jul 2024 10:45:56 +0200
Message-ID: <87ikx1ahx7.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Fri, Jul 19 2024, Zhu Lingshan <lingshan.zhu@amd.com> wrote:

> Gentle Ping Chairs.
>
> On 6/28/2024 5:28 PM, Zhu Lingshan wrote:
>> Hello Chairs
>>
>> Gentle Ping
>>
>> On 6/7/2024 9:48 AM, Zhu Lingshan wrote:
>>> Hello Chairs
>>>
>>> This is Lingshan who re-joined virtio TC last month.
>>> Prior to AMD, I was a voting member on behalf of Intel (lingshan.zhu@intel.com) for two years.
>>> I humbly request to be a voting member, please kindly help grant voting rights for me.
>>>
>>> Thanks
>>> Zhu Lingshan
>>>

Looking at the roster, you should have voting rights.

