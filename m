Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64492140E25
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 10:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720781258; cv=none; b=QlUWFV5GIrrwJz6U1RIOouQQFGyBsAro1+sv8+X73t8dRyo3X8NFFdhHxK5qsu2yy1CZImZWeUnLjYoKWTQJxEysK8dV65lbanIVF7uNLBOi2TWmq7EUJaEs2DFJBnfq6eOxr6nQJnxKixytEWUIxJ0U2+lDkxyiFy7wFM++soM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720781258; c=relaxed/simple;
	bh=XenuW9VKnsn6sXjcI+xdJP6EGj5sfT7GfiYDrjaHMTA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ftIYgeksi51LJPmN5bPJIi2uCtU5Fg3n7nEBa0DmGLmllEVvbnQG9IaPdZoUtFSSFGVcKrftMLBplmpmGj7qGlu9j0q26QydpP/5PGjCnDRw5ieC7vbn1D4op9IaW2R6hZy9bnLk7W9/RsWF824nBRe/KW8yEVYxo+AA44Iga4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BnBoab3a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BnBoab3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720781256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GKDnIYpTk8s0dWh2TaQ1ff7I7xv6PJil5glSXiT/OW4=;
	b=BnBoab3a+IDa1TFRK0KWuYUDXyLG0d1idiFrt3JoBEEOGog1S25LgnRadrmoOv6omTTD7n
	qddAc9yKOygQAS/3ZRSifq4yLDBMPW5X1mNWQgHw4TDRxqNa4Ru/90IH2chC0nHBJeKumH
	ZJWnU5RgFKm/Lrx3O78uviniqXTzDFU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-250-ih4VtgRxOP2LeZ4vDMqVDA-1; Fri,
 12 Jul 2024 06:47:24 -0400
X-MC-Unique: ih4VtgRxOP2LeZ4vDMqVDA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 445191935850;
	Fri, 12 Jul 2024 10:47:23 +0000 (UTC)
Received: from localhost (unknown [10.39.193.17])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7B6B51955E76;
	Fri, 12 Jul 2024 10:47:21 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <pandit.parav@gmail.com>, virtio-comment@lists.linux.dev,
 mst@redhat.com
Cc: Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH] editorial: replace hyperref with ref
In-Reply-To: <87le26c2i3.fsf@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240712041433.3246718-1-parav@nvidia.com>
 <87le26c2i3.fsf@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 12 Jul 2024 12:47:18 +0200
Message-ID: <87ikxac2fd.fsf@redhat.com>
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

On Fri, Jul 12 2024, Cornelia Huck <cohuck@redhat.com> wrote:

> On Fri, Jul 12 2024, Parav Pandit <pandit.parav@gmail.com> wrote:
>
>> Replace hyperreference with the reference.
>> Fix the broken link refernce for the DEVICE_STATUS part.
>>
>> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Parav Pandit <parav@nvidia.com>
>> ---
>>  admin-cmds-device-parts.tex     |  6 +++---
>>  admin-cmds-resource-objects.tex |  2 +-
>>  device-parts.tex                | 19 ++++++++++---------
>>  3 files changed, 14 insertions(+), 13 deletions(-)
>
> What is this patch against?

...seemingly it goes with the patches in the pull req you sent right
afterwards. Please always state the base.

