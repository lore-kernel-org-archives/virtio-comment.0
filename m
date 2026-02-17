Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D865829A1
	for <virtio-comment@lists.linux.dev>; Tue, 17 Feb 2026 20:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771361879; cv=none; b=CJRsrAiICZpC54OGeBABGON//YjZiG18b3TXZgKXppSHaHKJlei+s79Q8s88FJkYRJSBJvA3CRWizzsXSI1IiOWK3yE3b575NTTobqif2ianUBOQblMpQrm3r4sf3kMw/WHm+e0di/8Ca5nRxIHrKvetvfGZZPuVsewMUPdEfY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771361879; c=relaxed/simple;
	bh=C/nvxUsnx3aS/b4UZAMVfKM6hO48qHpXtoo72jAsimc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCCjQyhmnCTF/X9xK7g3lxKZgaISm4C7U37h6ZSFB7kzGxAsfETqNvftApssjdWLAzUrEzR9HEEmDuzTCeHHa1Cq52IPTOkPCt0bxy3cAUdXPUDXcb0T5ls5PvyEkAEhq0E9bVM/J8lKc6yns6KTsathfeTO4aGyGnHG4EbE6ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a2x/d6hD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a2x/d6hD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771361876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=oGxIIn4RNv/zzCfc77k4selbOdhz+aG6DjJfcUFvuQo=;
	b=a2x/d6hDHY7EX6IwfABhxRU+MBf8u0O2lz4RvRuuLBiKeTVmkyWkhDNj1LTdTv6guOydSx
	5a/YlplFqrEXuCWxP1lCpTRt9r1KZYuWBpPwDTVw67uvsFRGq13Wg42/4SYcy7opvUaevj
	SRaPgmdCP+3yzN4vCn/tXI7v1dGR0I4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-G1dUpkY3P1ulxlqLrvN5Ag-1; Tue, 17 Feb 2026 15:57:55 -0500
X-MC-Unique: G1dUpkY3P1ulxlqLrvN5Ag-1
X-Mimecast-MFC-AGG-ID: G1dUpkY3P1ulxlqLrvN5Ag_1771361874
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4836bf1a920so53613955e9.3
        for <virtio-comment@lists.linux.dev>; Tue, 17 Feb 2026 12:57:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771361874; x=1771966674;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGxIIn4RNv/zzCfc77k4selbOdhz+aG6DjJfcUFvuQo=;
        b=EUX1WJsv/XUkPGAliaKsfaRgk+PyABqLDCSPHlB7boqzn4/iW9vmkjf9Yi8U1pdSl4
         tRrPhVP39q4hW/Kb5fM3L8eiS+q8N1E0uApcOl4ifTg+LerAG2b8dcNf7Pbd89D9EZDO
         MLnjnBJrexbWmr3TZkFEdoCJQmc7grgPPRrrwDDm/7ZiXsyOhZZlOY+gq1io7M73CHzQ
         Do0Vc03C/iTXWeblIkNAAPb6MPJ5JPLncHSNhGKwi8mHyvrwNOwqQhhqTBO5Dzwsys3+
         UHXrMSsoonWXZ6oCI/4N4m89V9G8WxBjE2auwel2qmZiPgaHDumAZ8otTiT3USRC1XZC
         cCDg==
X-Forwarded-Encrypted: i=1; AJvYcCX9QE/vWTJWmQ2QJU5v29+fLgjRfowzaugHdHw0g7HxOQXXmDtWC5XJp/w0suzO77Ihc8uopB2wiJ9tO0Oacw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4vJ5O/PBCbzkfvIP5bmdKUFG4iYZ0hXiIXWgKL2u3zX06pIWo
	1r2PGvdY8Uhy2lnRuLCsZ/lQ600LdfzWFu+Ehci/bS8WvgykRx8lJQ6X8QL/6aXP2FXPZzoO7qK
	DRoeuODthEpd0fKk8GVcOTtT1Aa3ZWUEFlZEw7HU2dNcyIc/huvnzvkTRec19+K9eMlu3
X-Gm-Gg: AZuq6aKg9RT/TLG0Vd6HSJUDXfiCB5W7IxKKJdcVLCL6IOYs6+wVDfSJBOcNQkyNDqW
	Q7imYY0oa7oe74s/WQSQaYzDu7vViSlJjtet2wdev6l8cTJ6UA520OoURQSZkZr5BflqaHdJFdH
	/hJAE3nA1qFeeckHOsQgPzwb7jL7hL7GdycVh8UAYikbXW+EXxrjQzk3YWpwPGeYFOKygwlYpc5
	i1MhdkCVWDJYXI0px1XM3WgExsY/moZ1pD8gD9zObm1y7y7cX9W60xWZKnRgq2S2/A87j8y5LDg
	xzOg/wVExd9FGITTeson1xfJ81l4U14Glp+q8l3vnLW/HqT8pVwHbG+0a2aweiLIp/1sPd5DBjS
	Qhzv4TZVDsbKngUvuZRKjjssltzzxHomiVH3Lr/9myYDrNA==
X-Received: by 2002:a05:600c:6098:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-48379ba08a6mr212555485e9.12.1771361874172;
        Tue, 17 Feb 2026 12:57:54 -0800 (PST)
X-Received: by 2002:a05:600c:6098:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-48379ba08a6mr212555145e9.12.1771361873721;
        Tue, 17 Feb 2026 12:57:53 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac82f7sm40956951f8f.28.2026.02.17.12.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 12:57:53 -0800 (PST)
Date: Tue, 17 Feb 2026 15:57:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: OASIS-virtio@connectedcommunity.org, virtio-comment@lists.linux.dev
Cc: mst <mst@redhat.com>, sburla@marvell.com,
	alexander.gordeev@oss.qualcomm.com, aesteve@redhat.com,
	egranata@google.com, yishaih@nvidia.com, stefanha@redhat.com,
	david@kernel.org, Cornelia Huck <cohuck@redhat.com>,
	jan.kiszka@siemens.com, mvaralar@redhat.com, si-wei.liu@oracle.com,
	matti@qti.qualcomm.com, parav@nvidia.com, pasic@linux.ibm.com,
	jiri@resnulli.us, hengqi@linux.alibaba.com, shahafs@nvidia.com,
	lingshan.zhu@amd.com, xuanzhuo@linux.alibaba.com
Subject: head up: oasis password reset
Message-ID: <20260217154814-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6KPvVzcEp5gZ7gvoSRIKAdEXeGJHa-FC7AtIJQvseJE_1771361874
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, VIRTIO TC members!
You might or might not have noticed, but OASIS have recently migrated
parts of their system over to salesforce.  In the process, your password
will not work and you will need to reset your password.
The password reset link is:

https://o-o.my.site.com/s/login/ForgotPassword

(if I had to guess, o-o seems to stand for oasis open).
Hope this helps,

-- 
MST

