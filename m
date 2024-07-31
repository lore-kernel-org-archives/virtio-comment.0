Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A83A1AB512
	for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722419005; cv=none; b=ZgZniiufIqZQGp7pAIYSnlpLvu14pRc9IVjmwSYVOzxjLSnNPgcXt7PTCLbr68o5MIopHzGjpzncKOtGr+K0TbUIKQ75Wy4+S4NbyDRnm/6H+D72aNohBL6xlzD9/fzusZIXsFSo8Yc1amXDK+0PFncFjk+rwxjbsJz4sL0V82s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722419005; c=relaxed/simple;
	bh=Wmb4J93nk4DDfQ/oVVDAa67faQoZyEv7H5fpq6+iu64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oH9FwKpdZZ6MxSS5LC7zGWLcDZqhjHFIlWZfRBw1zk+ARu3b8dCASEYkzxVe2QUBffOLaXAMfdAG0IgBvQv720usvxOkD42xddoLeEbKZu4T2JMGv5FqD6ubtVWBUmsfO6mvm/t/+FSo9b42uV49NVJ4UnYOXDYXMkSPBvU/wbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YxkMyUM2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YxkMyUM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722419002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wmb4J93nk4DDfQ/oVVDAa67faQoZyEv7H5fpq6+iu64=;
	b=YxkMyUM2/q4tYDzw7bmxp7kPBVqkiLgncfwTyQObLb0TOXuxMvHUwtInlNTfRL0yXOz7kj
	LAj4CvxVq/GUcVpb602yg7q3n1pkUGGXTZNPNLYFafR3gx44sKOqca0bBnLQEgbM+jIO8g
	WD0zj38yxDxnqOdnMDxg6J7UuWO22DY=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-195-6AOMz8y8NeKKL-osrjbCUA-1; Wed,
 31 Jul 2024 05:43:18 -0400
X-MC-Unique: 6AOMz8y8NeKKL-osrjbCUA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 23EED1955D42;
	Wed, 31 Jul 2024 09:43:17 +0000 (UTC)
Received: from localhost (dhcp-192-176.str.redhat.com [10.33.192.176])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1497F1955D42;
	Wed, 31 Jul 2024 09:43:15 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, Vincent Guittot
 <vincent.guittot@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Manos
 Pitsidianakis <manos.pitsidianakis@linaro.org>, Parav Pandit
 <parav@nvidia.com>, Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH V8] virtio-transport: Add a section to define mandatory
 transport requirements
In-Reply-To: <20240731090414.m5hkzvq34djq6awl@vireshk-i7>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <1ef4e58fdbbc2c94305aa8fac856da882da1cdc2.1722324234.git.viresh.kumar@linaro.org>
 <20240730091155-mutt-send-email-mst@kernel.org>
 <20240731090414.m5hkzvq34djq6awl@vireshk-i7>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 31 Jul 2024 11:43:13 +0200
Message-ID: <87a5hx99se.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Wed, Jul 31 2024, Viresh Kumar <viresh.kumar@linaro.org> wrote:

> On 30-07-24, 09:14, Michael S. Tsirkin wrote:
>> Let's order it sensibly though, in the order in which stuff is used
>
> Right.
>
> diff --git a/newtransport.tex b/newtransport.tex
> new file mode 100644
> index 000000000000..3b760250a4c0
> --- /dev/null
> +++ b/newtransport.tex
> @@ -0,0 +1,44 @@
> +\chapter{Creating New Transports}\label{sec:Creating New Transports}
> +
> +Devices and drivers utilize various transport methods to facilitate
> +communication, such as PCI, MMIO, or Channel I/O. These transport
> +methods determine multiple aspects of the interaction between the device
> +and the driver, including device discovery, capability exchange,
> +interrupt handling, and data transfer. For instance, in a host/guest
> +architecture, the host might expose a device to the guest via a virtual
> +PCI bus, and the guest would employ a PCI device driver to interface
> +with the device.
> +
> +This section outlines the mandatory requirements that a transport method
> +implements.
> +
> +A transport provides a mechanism to implement configuration space for
> +the device.
> +
> +A transport provides a mechanism for the driver to identify the device
> +type.
> +
> +A transport provides a mechanism for the driver to read the device's
> +status bit.

Either "status bits", or "status" (as below.)

> +
> +A transport provides a mechanism for the driver to modify the device's
> +status.
> +
> +A transport provides a mechanism for the driver to read and modify the
> +device's feature bits.
> +
> +A transport allows one or more virtqueues to be implemented by the
> +device. The number of virtqueues is device specific and not specified by
> +the transport.

Do we also need to say that the transport provides a mechanism for the
driver to discover the number of virtqueues?

> +
> +A transport provides a mechanism for the driver to communicate virtqueue
> +configuration and memory location to the device.
> +
> +A transport provides a mechanism for the device to send device
> +notifications to the driver, such as used buffer notifications.
> +
> +A transport provides a mechanism for the driver to send driver
> +notifications to the device, such as available buffer notifications.
> +
> +A transport provides a mechanism for the driver to initiate a device
> +reset.

