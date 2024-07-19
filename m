Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3926B81749
	for <virtio-comment@lists.linux.dev>; Fri, 19 Jul 2024 13:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721394579; cv=none; b=rmvRpcDxNJ0bCp4yPyAIBaUtCYun0ZG4de4qCEsNJ5WICWFbiPheXZuqz9kCt8fi7F254IoPbt8oED8BcuUHmKdDXjeG5zu0IO2xvtpLry/QAkQFLrVaiqb3WuWOgsxVE4FaY4gaNWZdGnR/zpPHgreuGjWtJtH2btr+YTdZKrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721394579; c=relaxed/simple;
	bh=WrIVdthK91zYf+MBBX3OpKo9jcdU98XL6ZlwDdAd/1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hoi4fbUCztHXuhXkiIgHpKptWFAREVF4zSokzRXvos77ovr3f+K6uG+zPKm0FJTojdAHiSQ6085sf3+85m5tvjHm2aHo84FYU0vlI/e63f6+8mVXdwEVbFOX0v62Qmmz816+0MfdQMnqE1jWgZ6zkKpMS70AGm5tF0yr80e8ucQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UlHu8wtH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UlHu8wtH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721394577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3aN7t3CvwV7rlSFik7x71PLuQm5MQ1U70Sdibb0vwuY=;
	b=UlHu8wtH3s/A1bz2IgDDmYRi7Vk1FhpAtxhKB/so22iInvJyfYbUCP/eYCr1+gAkZpEw2X
	3utoMTj3UEkkOpXZthLNBwEoZVV6wVmzPaQLM+H/tzLdSYxONPir8JEsFHx3PJWE+6qaXR
	1ZK7l/qFC7Th27JQbEIKkU8mtUdLggM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-27-tQofqlKPMpiTbFHwFQsLfg-1; Fri,
 19 Jul 2024 09:09:33 -0400
X-MC-Unique: tQofqlKPMpiTbFHwFQsLfg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2596F1955D53;
	Fri, 19 Jul 2024 13:09:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.162])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 575F01955D4D;
	Fri, 19 Jul 2024 13:09:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 21FFF1800D65; Fri, 19 Jul 2024 15:09:28 +0200 (CEST)
Date: Fri, 19 Jul 2024 15:09:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, 
	Rob Clark <robdclark@gmail.com>, Huang Rui <ray.huang@amd.com>, Sergio Lopez <slp@redhat.com>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>, virtio-comment@lists.linux.dev, 
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 0/3] VirtIO-GPU spec improvements
Message-ID: <nfhf7nas5ls34bbuyb767jhljanvs7zkrbaessaoocrbjjoac4@jkmjpfxlvu2l>
References: <20240719120638.196052-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240719120638.196052-1-dmitry.osipenko@collabora.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 19, 2024 at 03:06:34PM GMT, Dmitry Osipenko wrote:
> Hi,
> 
> This is a repost of v2 to the new virtio-comment mailing list.
> Michael Tsirkin suggested to repost the patches, here they are.

Series:
Acked-by: Gerd Hoffmann <kraxel@redhat.com>

