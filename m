Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623B013D8BA
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718090758; cv=none; b=lpBJdnlB9HSo5CprziQzy/X+/VjgGv+GU8zf9cAgaFJUJZBAYDWpgO3U2QwjgYFt0GTroUC5dli4T4qEJHwcaUKX0sOhwdbeF2XNW32gJKW3vHN3zuHYiN8QA49mLitWj2JRyLmD8uPdaNXsCXDZDv1SO4f8oOt8fNLvotyITDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718090758; c=relaxed/simple;
	bh=4YQwNL4i6dUUpEZGaa21CLB7Eq1B1kx+OHOmzVjSTfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=R3WPbb/2JXHVfw3ZaJfK0LQ8pMDKd7wc/ZwStBaudmCC8ouNzBwEQ1x4KcHfdTa/Hal/MyChkaZCFB1KQCfoCDCAYXQzFKZS3N/xh6jOnNbvdNcd2nan2TAQnJ6ua53/ET1ZFg6RQra/+pdrkBEUNtJqgiAKKQYgPX88iCI04UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GG6WGKTW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GG6WGKTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718090755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rr2NN70cGClwNcrWniNFMa2CEbYMk72v0gMeo6l3xD0=;
	b=GG6WGKTWLMlGNUXOwqY1F+8vUcntSszR+k3/+C5pMskJ9sN4XaJ60Dm4RJKbNivHQmcS5y
	AD5IwkzqdPBnEFLvCsRBKNIw61EPsTq0Dd8BABZvJfJHk3cm69DKipvWiKMsQ1VQr0ogZ3
	ZpOHglTSApb5PcUgd2pp6wg1aXbsj3g=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-UfM87jLLP9epI6neiBGxUQ-1; Tue, 11 Jun 2024 03:25:51 -0400
X-MC-Unique: UfM87jLLP9epI6neiBGxUQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52c0bfd6a89so2667184e87.1
        for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 00:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718090750; x=1718695550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rr2NN70cGClwNcrWniNFMa2CEbYMk72v0gMeo6l3xD0=;
        b=atu2O3N3ojnK6XKW9H7PNdwwvZxUOaiiqK1HvPio+sLSoY1NvcLzMjcYLDwHu8izVF
         I7CumR+rm3CwW/wH+80+ZZMiPWsMVF9eESvgG23EwS8oW5DqDkX2CAu1xwDwM7I+pUpt
         pec3+VDYi0Qj/o1X8VDHqoKT/4B2KmhmNrI388Hm55VWi7Lt42y2FdO3VHZquS1bi1xO
         zf/n7e5OWoj/DX1Ixz+xdSFQR4AjywZZ66x0YOCi9PV2+qbp7U89CV8Ol1qsm6ZKdrtH
         un8WFuw0EtwYcAnlePM8pbI4xxcdiF3KmFij68lIY2AomFbJttAGu1F4EqBzIyqmTgSF
         T7uQ==
X-Gm-Message-State: AOJu0YxXJHx5VaU5MLy1374IMBbuPm/az3bU+KcL2DNQTrgoTe7drPjf
	YKhf1tCKeA3QKARTl6MZ+RT/PGB7Jmbzwc4swAWl/vuW/58ZU3933U7ICMMBvt+ZDxv5r7wBx3g
	mqyiQsrtFKXGaS3VqI3ZU2dcT3+W/vNv1Cek4wR4/PmZ5MY9WItPdCFwopFJL61LY
X-Received: by 2002:a05:6512:28a:b0:52c:7a2d:5d5d with SMTP id 2adb3069b0e04-52c7a2d5f56mr4998947e87.3.1718090750051;
        Tue, 11 Jun 2024 00:25:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzOEUVajFTUZ1cfYC+SkQBPpgK9qrCNPxfkvXLEqJGPV5BuVLsSgbC4O1tPIhvB1XifspNuw==
X-Received: by 2002:a05:6512:28a:b0:52c:7a2d:5d5d with SMTP id 2adb3069b0e04-52c7a2d5f56mr4998936e87.3.1718090749610;
        Tue, 11 Jun 2024 00:25:49 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.202.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4221defede0sm32139845e9.7.2024.06.11.00.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 00:25:48 -0700 (PDT)
Date: Tue, 11 Jun 2024 09:25:46 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Hilber <peter.hilber@opensynergy.com>
Cc: virtio-comment@lists.linux.dev, Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH v3 1/2] admin: Refer to "no order constraints" only for
 different queues
Message-ID: <cnvz23gk2jk4b6vspqhmbcyaefrujysrnbz5fff6k2suufctkx@gc6vkzkreshc>
References: <20240605110133.31568-1-peter.hilber@opensynergy.com>
 <20240605110133.31568-2-peter.hilber@opensynergy.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240605110133.31568-2-peter.hilber@opensynergy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, Jun 05, 2024 at 01:01:32PM GMT, Peter Hilber wrote:
>The non-normative section says that administration virtqueue commands
>"will be consumed with no order constraints". But actually, the
>requirements stipulate a total order for all commands in the same
>virtqueue:
>
>	The device MUST process commands on a given administration virtqueue
>	in the order in which they are queued.
>
>	If multiple administration virtqueues have been configured,
>	device MAY process commands on distinct virtqueues with
>	no order constraints.
>
>Fix this by narrowing down the scope of the sentence to "commands placed
>on different virtqueues". Also, narrow down the following example to
>one with different virtqueues, and reword the example to better fit the
>narrowed sense.
>
>Fixes: bf1d6b0d24ae8 ("admin: conformance clauses")
>Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
>---
>
>Notes:
>    v3:
>
>    - Refer to "virtqueue" as such (Stefano Garzarella).
>
>    - Narrow down example to have different virtqueues (Stefano Garzarella).
>
>    v2:
>
>    Be specific about case without order constraints (Parav Pandit).
>
> admin.tex | 9 +++++----
> 1 file changed, 5 insertions(+), 4 deletions(-)

LGTM!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/admin.tex b/admin.tex
>index 0803c269e5c4..751918443d0f 100644
>--- a/admin.tex
>+++ b/admin.tex
>@@ -457,11 +457,12 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
> The driver enqueues requests to an arbitrary administration
> virtqueue, and they are used by the device on that same
> virtqueue. It is the responsibility of the driver to ensure
>-strict request ordering for commands, because they will be
>-consumed with no order constraints.  For example, if consistency
>-is required then the driver can wait for the processing of a
>+strict request ordering for commands placed on different
>+virtqueues, because they will be
>+consumed with no order constraints.  For example,
>+the driver must wait for the processing of a
> first command by the device to be completed before submitting
>-another command depending on the first one.
>+another command depending on the first one to a different virtqueue.
>
> Administration virtqueues are used as follows:
> \begin{itemize}
>-- 
>2.43.0
>

