Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E9419F41F
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 11:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725364722; cv=none; b=X+nltMf6kIoACcsbUF3KAMfEVrUDb5fP7FjbfV259rRdPdx3q2cbDtjVmQyMQoktk7KZn4OstwJYAgADYFSIU98LXLqxqVOLIStNrtgmIa6hxHRh9V1V1k20iZxaORNXJ61fvi3pvk12axqj3KPbis4hTeDpbCIVAG3HgNpUFyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725364722; c=relaxed/simple;
	bh=34My8aYyupl0NwVXgpvM1OjkGScHYsBYrTIcNdo0g/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=T/S8b63TVjKwF8khRpVPXhcpVg46pgBD4TE6ytVIidj3+EAGQqStV9kNGcebnHtyn8ZPBO+eXFO9UZcdyuJP+FN5gyBe1nD565uTUNdhLC5RbN8DjpxMhPKOt5SnKBWhRZHq9/bR+IAqsewxtFr6UQSqCSWM1y3qcD+qSc5wUrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fYxrVg2E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fYxrVg2E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725364719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F+geC1z/0cIGidyzC++CT9Vzc6RLCiGiSDUeDPfoCwY=;
	b=fYxrVg2EBLXyOU/OshYPXK9Ng57g8+AdFURky/BKzAv8kTf3YYXMMTtQusP3SjXinEduTT
	rrggapQS0aAGrDG2m4ijRUdby9HEhIo+atvnYItbgvDwGr0BYa2A83z0X3q7EPqvccRTe/
	aLWTzMJl+6/7CsFH04YBcldlBW66lI0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-W9DIgoTaPDmp6F_6S4u9Fg-1; Tue, 03 Sep 2024 07:58:38 -0400
X-MC-Unique: W9DIgoTaPDmp6F_6S4u9Fg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42bb8610792so46303635e9.3
        for <virtio-comment@lists.linux.dev>; Tue, 03 Sep 2024 04:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725364717; x=1725969517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+geC1z/0cIGidyzC++CT9Vzc6RLCiGiSDUeDPfoCwY=;
        b=a6j+ES4ncv19XLUQcdi2FyPYDQ7H2TWkigfYO9tuOzbQ4Jq/cy9Ove+TwmGBGFywXE
         dpR8BpEMNqqbaPjie0z8P3qVpKi0hrYeuneA6KHY39KWsKYMi1i0FjgMk5POCkQdVesj
         F5gbZ/up6AF8dxqTel1nPWFdchZlxfsgYuQE+oAWKRgdGmPvNi9wYGajiAXTZrIzDgNj
         v2WqwhL1v8mvxwsJ8izObdW334/GStkdeiIAqCMV7CSfS6azNoRqDH8+1JyckMeTf/lq
         OKOU/AsYPAIMAspQRp9642+8UXlJEZImSXpeAAF36AhZzgyMu+HQ1HqIfS76NwrP6IBm
         biEg==
X-Gm-Message-State: AOJu0Yw/RGp72jTb40Kaq5HUTGt0YBPThXy+FLiqjc+Dwn9aNwYDDYld
	cxvJtYjzV5HHCvJlS57jhPNwUHDYB5aq0PzfVFzXLfouZzNcbkAIqCc63N2FzBg62HLCs4MYhZj
	Gb9vVgYnG9l3YfNTboMnHTeNKL0LuuqzTRN9LcOPq2r/+GpHC8wfa8uL5U9VDRJ0A
X-Received: by 2002:a05:600c:4585:b0:426:554a:e0bf with SMTP id 5b1f17b1804b1-42bb02ee854mr123283345e9.16.1725364717456;
        Tue, 03 Sep 2024 04:58:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn9xNDgdgB2Axe/8GFofL+medzpQdjc9fnI7Qx19qZAf3QHcb7wZiccdbVGB5shCIXSYD+kw==
X-Received: by 2002:a05:600c:4585:b0:426:554a:e0bf with SMTP id 5b1f17b1804b1-42bb02ee854mr123283155e9.16.1725364716588;
        Tue, 03 Sep 2024 04:58:36 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.98.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6deb43esm169923025e9.7.2024.09.03.04.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 04:58:36 -0700 (PDT)
Date: Tue, 3 Sep 2024 13:58:30 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.linux.dev, 
	Vincent Guittot <vincent.guittot@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V10] virtio-transport: Add a section to define mandatory
 transport requirements
Message-ID: <xtzpm64wmfkrb6y7yo2sx75o6o4ll5ngsxme73q2ttrkjl3qhn@yqo2qczgxih7>
References: <4c24ede14e2545b2e9c69e7d9b79dc15744fd965.1723647318.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4c24ede14e2545b2e9c69e7d9b79dc15744fd965.1723647318.git.viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, Aug 14, 2024 at 08:27:00PM GMT, Viresh Kumar wrote:
>The current Virtio documentation lacks a set of generic requirements
>applicable to all transports. Defining these generic requirements could
>be beneficial when integrating support for a new transport.
>
>This section outlines the essential requirements that any transport
>method must adhere to.
>
>Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>---
>V9->V10:
>- s/multiple// and s/employ/use/
>
>V8->V9:
>- Change order of the statements.
>- Specify DEVICE_NEEDS_RESET and FEATURES_OK bits.
>- Language improvements.
>
>V7->V8:
>- Remove separate sections for device/driver requirements.
>- Remove optional requirements.
>- Other generic improvements.
>
>V6->V7:
>- Remove parts that talk about accessing content of the virtqueue.
>
>V5->V6:
>- Move the changes to a new appendix section.
>- Clarify the requirements a bit more based on review comments.
>
>V4->V5:
>- s/The transport/A transport/
>- s/MUST provide/provides/
>- Added some text for transport requirements.
>
>V3->V4:
>- Remove the normative sections and use direct speech.
>- Change wording at few places.
>
>V2->V3:
>- Minor fixes.
>- Added Reviewed by from Alex.
>
>V1->V2:
>- Lot of changes after discussions with Alex and Cornelia.
>- Almost a rewrite of the first commit.
>- Add Transport normative sections.
>
> main.tex         |  2 ++
> newtransport.tex | 43 +++++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 45 insertions(+)
> create mode 100644 newtransport.tex


LGTM!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/main.tex b/main.tex
>index b1913d65e964..6d337217a3d1 100644
>--- a/main.tex
>+++ b/main.tex
>@@ -42,6 +42,8 @@
>
> \input{newdevice.tex}
>
>+\input{newtransport.tex}
>+
> % acknowledgements
> \input{acknowledgements.tex}
>
>diff --git a/newtransport.tex b/newtransport.tex
>new file mode 100644
>index 000000000000..b3e0df42fa2d
>--- /dev/null
>+++ b/newtransport.tex
>@@ -0,0 +1,43 @@
>+\chapter{Creating New Transports}\label{sec:Creating New Transports}
>+
>+Devices and drivers utilize various transport methods to facilitate
>+communication, such as PCI, MMIO, or Channel I/O. These transport
>+methods determine aspects of the interaction between the device and the
>+driver, including device discovery, capability exchange, interrupt
>+handling, and data transfer. For instance, in a host/guest architecture,
>+the host might expose a device to the guest via a virtual PCI bus, and
>+the guest would use a PCI device driver to interface with the device.
>+
>+This section outlines the mandatory requirements that a transport method
>+implements.
>+
>+A transport provides a mechanism to implement configuration space for
>+the device.
>+
>+A transport provides a mechanism for the driver to identify the device
>+type.
>+
>+A transport provides a mechanism for the driver to read the device's
>+FEATURES_OK and DEVICE_NEEDS_RESET status bits.
>+
>+A transport provides a mechanism for the driver to modify the device's
>+status.
>+
>+A transport provides a mechanism for the driver to read and modify the
>+device's feature bits.
>+
>+A transport allows one or more virtqueues to be implemented by the
>+device. The number of virtqueues is device specific and not specified by
>+the transport.
>+
>+A transport provides a mechanism for the driver to communicate virtqueue
>+configuration and memory location to the device.
>+
>+A transport provides a mechanism for the device to send device
>+notifications to the driver, such as used buffer notifications.
>+
>+A transport provides a mechanism for the driver to send driver
>+notifications to the device, such as available buffer notifications.
>+
>+A transport provides a mechanism for the driver to initiate a device
>+reset.
>-- 
>2.31.1.272.g89b43f80a514
>
>

