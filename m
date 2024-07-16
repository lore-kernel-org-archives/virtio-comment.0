Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7C625624
	for <virtio-comment@lists.linux.dev>; Tue, 16 Jul 2024 07:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721115329; cv=none; b=DD5PViYiCj7YdgMTKgY3tbv28KnkH+Y9hdhK7AKh0P1DFnysWJdSGNKkvsGDocUCdzaGcEV9nYBc1QzTij/6MFYKUH/uhhO4ggmTn9YEpgMvO9eEtSKaBNppNAjs86oi0tr6WMEkfd4oXFcQXhlvTwFYv1rfpuM65cqnpVDtuqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721115329; c=relaxed/simple;
	bh=aeGhs59GrfzYUBSlONz+VE4lHb1HJZRydtdIbCxhXo8=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cgXfjMhDuQ3XqP7Md719NNQveuHQhg9caua2/VDxTNNVVBUj6QvSqMVgDM276Wq3cBcRD6xx1jrp1g4QMuojYo2UuoP1wyiB58EhjmvtjdqaCLl/I6RASJnA9/3Qj49aRtFe7cmcZ0DcjHIe/lwGdQed+Dd6pnEcha6+H7zuR+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GMiW/Vts; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GMiW/Vts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721115326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dm1M5ODghQxwXBrpwZ9bsgsH9mESk6VeWPJlCf61oIM=;
	b=GMiW/VtsX5uZ9zJYdrK8EkAQqCeFgq/dM3ZOZDymNxd2/6vAwvRFWdxOBA1UGIv8uK7XhD
	r877I0945TyXVmSnV8ACYTt0ufgirnn1HDdnvt9HunscTONREecq40KgUuaioH34+9xQyj
	D+e4GY4efvWz4lk1VvhonUPcT3MWhEo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-75-AKJKoVfxPNiE1grK26Qbfg-1; Tue,
 16 Jul 2024 03:35:25 -0400
X-MC-Unique: AKJKoVfxPNiE1grK26Qbfg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0592A1955D45
	for <virtio-comment@lists.linux.dev>; Tue, 16 Jul 2024 07:35:24 +0000 (UTC)
Received: from localhost (dhcp-192-176.str.redhat.com [10.33.192.176])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4F08C19560B2;
	Tue, 16 Jul 2024 07:35:22 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.linux.dev
Subject: Re: [PATCH 9/9] admin: get rid of _ in labels
In-Reply-To: <3e773fcfd4246e66e6f39d3be95d2c0335e34532.1721062136.git.mst@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <1130700f4ae71a93d9887af35cf105731219f057.1721062136.git.mst@redhat.com>
 <3e773fcfd4246e66e6f39d3be95d2c0335e34532.1721062136.git.mst@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 16 Jul 2024 09:35:20 +0200
Message-ID: <87y161aix3.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Mon, Jul 15 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> it's not the 1st time we find out underscores in labels confuse
> latexdiff machinery when generating html.
> Errors look like this:
>
> ! Missing \endcsname inserted.
> <to be read again>
>                    \unhbox
> ....
>
> ?
> ! Emergency stop.
> <to be read again>
>                    \unhbox
>
> To fix, convert underscores in labels to dashes.
>

Hm... should we add a "Avoid common pitfalls" section to the README?
Anything else other than avoiding underscores in labels?

(Not sure if that will help, things like that are easy to miss.)

