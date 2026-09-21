Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BA33AE1BD
	for <virtio-comment@lists.linux.dev>; Mon, 21 Sep 2026 08:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979145; cv=none; b=todIcprry6xye4A0IBKTwbvi26ONMrVVh55JfjGW07/MLOBZIzXX1Wyk2hgSRyOZtTYfp3nefUjOr1JKFq5a/V0CfWAxfuDL0EDf70RS1Dfoh8J1zPu+CrlmH2L70eixtyTc3Fy8gTuPAP5EcIEqKN46da1qLqPat/XXHFBNlEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979145; c=relaxed/simple;
	bh=cljfyzu05O6mRmhZNs3o3USWq9f05uAOVbaQTaeR2ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=h8XWGXYEO8wOowTOsIwqGLNnIOsQVrzBkAtfmBY1P8KZ/ONIkqe9kcXusWjQDyDOkJrWelVqi6EoEMRQJtfO497z2visCTE/UicBh9vJ+0U6ssNExavUwvZzOOhGK9fuRpN1bYcyweHVpNPrLZx4MQKvCz0nqr2o17g6x7urlwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FwZAQwZe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FwZAQwZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789979142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3UKWDfp9H9kyJT6bmwTR7Z9tuifv5UmoZQLHsuFs7pI=;
	b=FwZAQwZe6sxpmPk75l5n0SdGAvbVw5VEDiuffnK47cMUNtRFI3zFfJ0xKDASGJp3J6M7bJ
	6kVHAoF+5wnNcAx/+qS9OlctCRFqier6tEc+GYQ9hNr6EwQoQBuTUIR929GyFRIpkOyFlF
	PaUEtl5PH30lwLaNDXWtHvIZyhFyr+Y=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-508-E9Ynr41uP1a_nikFM3_zdg-1; Mon,
 21 Sep 2026 04:25:40 -0400
X-MC-Unique: E9Ynr41uP1a_nikFM3_zdg-1
X-Mimecast-MFC-AGG-ID: E9Ynr41uP1a_nikFM3_zdg_1789979140
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA3F31956069
	for <virtio-comment@lists.linux.dev>; Mon, 21 Sep 2026 08:25:39 +0000 (UTC)
Received: from localhost (unknown [10.44.32.27])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EC635180036E;
	Mon, 21 Sep 2026 08:25:38 +0000 (UTC)
Date: Mon, 21 Sep 2026 09:25:37 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: virtio-comment@lists.linux.dev, "Michael S . Tsirkin" <mst@redhat.com>,
	stefanha@redhat.com
Subject: Re: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260921082537.GH1436@redhat.com>
References: <20260908094050.915173-1-rjones@redhat.com>
 <20260908094050.915173-2-rjones@redhat.com>
 <aq13FIJ3xzCGzqzq@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aq13FIJ3xzCGzqzq@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p6UqgZ-ifZBzNxHH35T6ChbSZY8rae7bASAbTFVcu08_1789979140
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Thanks for the review.  I just want to note that I'm not going to
pursue this patch further.  If anyone else wishes to take up the idea
then please go ahead.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org

