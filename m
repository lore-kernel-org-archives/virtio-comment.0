Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CC11465B8
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721041940; cv=none; b=LXd+Dtm9h5mGWCirfNqKh2S9MvVweXJ7kIwDbYZ74LUKbPgI3dgbIRYHKUtKRLZcYHwol+ngoD5KFEyr1aEkhOsqFuZfkyZBgaPoA1OFfqdmprbmTtAUC9NwoLTY0oT/IRyPKmrsdsPIl2j+HN8c39zu9nuQ24jylLHFHjsg1K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721041940; c=relaxed/simple;
	bh=ZM6MzvN2S1esvjxIxnLhURNbqxCqCDZWgbzVaZ9/njI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SFQrpHr9oKdJrV60OCX4K+znja5BFZRRCh/U2YBiVhbvveFQOxRj0SoV60GxuXyUrNUzZy0gzxFiwlZYdksurOHF8EXsjDCm1I5UPZEOSRNxHcYo0oENamtvqMNN32sXvxpZBQEjy7iCmzgRCeHt77+2YOpXFzwqigYsykvzw00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fjMWSV7Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fjMWSV7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721041937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZM6MzvN2S1esvjxIxnLhURNbqxCqCDZWgbzVaZ9/njI=;
	b=fjMWSV7Yp5ybm4jtB0ht03XCiePETzL7E7YsZqeXLpDuSCDRHGnzGvhnJI13naXb4AQ6uv
	clvTk6T3XQYDaV7LSppWVJaOdYKjuL6ECFB65mYM9W3Sx3LN9IvwvGhy5/KiCNk9/UIzv+
	Fhs6MH3mR2n70MC5C8Mr58cvltCe2hc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-219-V8vQ23jTMX2smdHkbK6F7g-1; Mon,
 15 Jul 2024 07:12:15 -0400
X-MC-Unique: V8vQ23jTMX2smdHkbK6F7g-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 05BAF1955D47;
	Mon, 15 Jul 2024 11:12:15 +0000 (UTC)
Received: from localhost (unknown [10.39.194.121])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 210A01955E80;
	Mon, 15 Jul 2024 11:12:10 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PULL v4 ] administration commands for device parts
In-Reply-To: <20240715060431-mutt-send-email-mst@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240714150028.3292710-1-parav@vr-arch-host06.mtvr.labs.mlnx>
 <20240714115023-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481DCC7A15A54F6595AF7F0DCA02@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240715060431-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 15 Jul 2024 13:12:08 +0200
Message-ID: <874j8qc3jr.fsf@redhat.com>
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

On Mon, Jul 15 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> OK I figured it out.
> It's because you have the xtabular commit in there.
> cherry-pick logic was picking it up because it
> included the Fixes tag for the subject it was looking for.
> For now I just switched it to looking for a regexp and added ^
> in front. Will break if we have commits with special
> characters in the subject, but we'll worry about it if
> this occurs.

I'd also advocate for avoiding special characters in the title, if at
all possible, since it is not clear what else that might break.

