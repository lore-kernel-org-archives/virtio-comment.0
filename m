Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DD82EDD6C
	for <virtio-comment@lists.linux.dev>; Sun,  5 Apr 2026 00:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775350583; cv=none; b=u57h/qmBFcJXeB4x9cfFkNnPDFGV0KKwcE7KqyhRftvV8D0DaIcBkMFTNtxoUebA3iKse9o2W2mEVkFJu93O1Dtfro0RHCT7ffew1wqf+NYbebCngIyUQzwdYEwy//blLLzBn6ibMz2ZDH/VU7fxlEwt3kv7Lt1sGa+0SivEYFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775350583; c=relaxed/simple;
	bh=k43BfN9OQf69JupUXwqvbmyGOAvaXGwl5FYmHUywfLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=WUnqQ0d5nyOMJtPCwWNJfMSovn2EqhaG+bYDtJzydrTxaz5lT6Q6a1+tzgLwC4CmLsnzWlRkXOVxolZr6T+A0+dzwtMsVtTJvvye0j6yh/0ui6jwTFYN0KfWtN9Gti3HwInXUcZNbZx/L4u+fBwlTc/vmC+Tw+BoRTiuk14DRuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EKQP2XDo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EKQP2XDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775350580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GlPDRpJZr7tf8iAbzmPhxdrR0FeLz6reQH/lEudMveM=;
	b=EKQP2XDor2wUSLfDDrGfPQyPT7NY2TwyaOz2B6VyjJ5TxltAodVpwzh9XV2x3xBYUwuCNS
	17D+2gX2yHiS7tszN1+KAyGbXCZAo1tcrJR1O/Nwa60+zSU0nZq4xCUdaqu+jGz84Ttf0r
	j7RvU5BXypYfMHu3xVp3yPL3iqxRf/k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-yW_00Ft5NIuaYyshbYJhNA-1; Sat, 04 Apr 2026 20:56:19 -0400
X-MC-Unique: yW_00Ft5NIuaYyshbYJhNA-1
X-Mimecast-MFC-AGG-ID: yW_00Ft5NIuaYyshbYJhNA_1775350578
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-486fc42c83aso28396705e9.0
        for <virtio-comment@lists.linux.dev>; Sat, 04 Apr 2026 17:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775350578; x=1775955378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlPDRpJZr7tf8iAbzmPhxdrR0FeLz6reQH/lEudMveM=;
        b=p7p8OSB8aMyq7JDuw8kzDefkuW+pawVEVv/B3z5gsOcW1JzBds1/QvnTFGh0C1yI83
         +ybwyAl1GyNTXnmqa639jZ470bRNKMhuNRq/bBSC/Xaft7KuU/9Mp8Q+kz0ytaEi4puV
         d95pWHqy/EDLY/qrEEF9SsieoWpnsv8eYCMFFvtEwwl2Uu5jIDC3jbVSARtJppiyl0tt
         pb83wjOchItRCESEd0dE8JRcv2inwpFIdfpljP39/mMtEt7+l5W/S7ZkcnuyA5e95TIn
         KpOxzOknn6n/vy8r8ycsVugAbhvOyyvXB78+aHAGtIRjU4Qe2JymQ/SsG6cM0Eb9WLRN
         s3rQ==
X-Gm-Message-State: AOJu0YwyrVkz5imCFGEfHV/mEwfJfcZc2bnX3WcQZbTCelfP54BhnKZR
	coJUOPD3xWceuxndl4EX+C8JDx8/yyv/wgIyA93jlV/yIDpKyA12GRs/eCUpLKk45Q7m+tCDqC/
	3/bx9a8fdf/Rp1W1xKOpIFxjE0oaoVF7N0ffDiNxTGjl+vz37vh+n8eQPstsJNJ+bvzIg
X-Gm-Gg: AeBDiesvs3EO6vb4UfngB6fBjTx9KykD2YfPlMh8aIGwUFJM3Lr9514QnxqMfOKqw3F
	VnWGsdcBMF8ahSxVAhZnlCp/eH5yK6CTaPKLEpAW8M945Yipigi/NYJH2vnANRqSKUw4GjIksGc
	sd1poweugaIkDVMYMpa7oK7m/riyTPuZYw/inZGt8uOjSV98SLSsAAnKyzcPilOwfGmfEZLr23e
	t7q/FL6A4nb2TDqwoTu1rgMoQK0hmNVzIsgLePeo37EZncLzfr7yQAN0oH7yVwOdkpcA23rnRdB
	H8hdpROQg7T+pdlR08V4mIBsAME6OYySqJDG0Tso8T1pmR+Mkjiabn9gfZoDLF41nxClD/BtkSK
	F9cDx7cZdqA==
X-Received: by 2002:a05:600c:3546:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-488996e8774mr116452445e9.9.1775350578134;
        Sat, 04 Apr 2026 17:56:18 -0700 (PDT)
X-Received: by 2002:a05:600c:3546:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-488996e8774mr116452225e9.9.1775350577545;
        Sat, 04 Apr 2026 17:56:17 -0700 (PDT)
Received: from redhat.com ([31.187.78.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a63esm486201725e9.3.2026.04.04.17.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 17:56:16 -0700 (PDT)
Date: Sat, 4 Apr 2026 20:56:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: Should there be a mode in which the virtqueue -> MSI mapping is
 fixed?
Message-ID: <20260404205140-mutt-send-email-mst@kernel.org>
References: <e8a35333-589a-4a00-8e1a-32d497171e56@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <e8a35333-589a-4a00-8e1a-32d497171e56@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Hq9z7THATs05DRxrrxW2JqNWYLyZGxzhsaF6fO19B-Q_1775350578
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 04, 2026 at 05:19:41PM -0400, Demi Marie Obenour wrote:
> Cloud Hypervisor's vhost-user frontend does not implement MSI-X
> properly [1].  Specifically:
> 
> 1. Reads from the Pending Bit Array (PBA) always return 0.
> 2. Changes to the MSI associated with a virtqueue after the device
>    is activated are ignored.
>    
> Amazingly, there have not been any reports of this causing breakage.
> I have a fix for the first [2], which actually decreases the amount
> of code.  However, the second is trickier and I'm tempted to not
> bother unless it causes real-world problems.
> 
> Are there real-world drivers that will run into either of the above
> bugs?  Linux seems to only choose anything else as a fallback, which
> presumably is not triggered.

It will sometimes trigger.


> One reason I am asking is that I am working on an updated
> virtio-vhost-user spec, which I've renamed vhost-guest.  A vhost-guest
> device implements a vhost-user server, and requires one MSI for each
> virtqueue of _the device being implemented_.  The existing spec
> allows the guest to select which MSIs are used, but that seems to
> be pointless additional complexity.  A simpler option would be to
> hard-code the MSI assignments:
> 
> - 0: Configuration change interrupt.
> 
> - 1..N (inclusive): Queue interrupts for the N virtqueues provided
>   by the vhost-guest device.
> 
> - N+1..N+M (inclusive): Buffer availability interrupts for each of
>   the M virtqueues that the driver is implementing.


you can do this, and imply ask drivers to share msi vector values.

but sharing has to work because # of vectors in the system is limited.


> I expect that all real-world drivers for vhost-guest will select
> MSIs in this manner.  Hard-coding it makes the device implementation
> (and specification!) simpler.  I'd also rather not ship the first
> implementation with a known bug!
> 
> [1]: https://github.com/cloud-hypervisor/cloud-hypervisor/issues/7813
> [2]: https://github.com/cloud-hypervisor/cloud-hypervisor/pull/7963
> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)





