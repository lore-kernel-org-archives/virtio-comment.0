Return-Path: <virtio-comment-return-7465-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C44CD3443
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 06:58:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DFE5866DCD
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 06:58:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B558F986533
	for <virtio-comment@archiver.kernel.org>; Tue, 19 Sep 2023 06:58:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9A3B5983E25; Tue, 19 Sep 2023 06:58:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 89A019864C2
	for <virtio-comment@lists.oasis-open.org>; Tue, 19 Sep 2023 06:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: zFtvHac5P82epiVKJpLqmg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695106715; x=1695711515;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oiz3xhs8yUJwx1oxjEQDtecnRNFKB2NCXCzRkYASGKA=;
        b=KFM3s2slYqN29XzlfJD51+jTBb9kLNeN4+TCIwcjaVCMJ6TSRzneoIn7QPsCQcDwQI
         YEdyIebXSfZp2smWB2LWpPRo+R+vG64L+J735uK6X4gS8QPCkdD61D31a3UGRtNkj0mC
         rFZ0f2NOFyCZ7HjOeusrlp2VjWAd6+yJe35Jl11/TDJNAsINZuTTbInGHZBMVq4U1SNH
         O97s+L4kKLW7FiWX3KVHSWByj/lG6MZV0Xa4xFvEfayKNNdRkqr7btieqkodcJA2KuTC
         AZiYDtnw1pwl5hc0c/eVenfSXyMI8FUV7Cl2AAszKvz3LDb4zJSjAeRLN4lYzVZrkDrR
         gaUw==
X-Gm-Message-State: AOJu0Yxu5nHg8a8mFsnqNnbdmaneTMaXG4luoTr1U3rut3e2mdWtnXi1
	2amnSLzj+Al9yJG+i+7XlFtVz/94toXdmGB05gJrPgMVqPTxHN0XDgQuEse+YPZnIToTn8XDefg
	TDhaHOWWXtrbwbo7uFrtdic6NVfG2PT1VSA==
X-Received: by 2002:a1c:7419:0:b0:403:cc64:2dbf with SMTP id p25-20020a1c7419000000b00403cc642dbfmr9288346wmc.27.1695106715190;
        Mon, 18 Sep 2023 23:58:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfrZ6JfsrZZDA0i+gwD/TumwJ0Jvnlwz1JmY/9HBL1N1ds0mga27C7Fa9qSJpFyixodMfrsQ==
X-Received: by 2002:a1c:7419:0:b0:403:cc64:2dbf with SMTP id p25-20020a1c7419000000b00403cc642dbfmr9288331wmc.27.1695106714832;
        Mon, 18 Sep 2023 23:58:34 -0700 (PDT)
Message-ID: <64adaae1-28a6-b175-9fb0-f4f2c26e696e@redhat.com>
Date: Tue, 19 Sep 2023 08:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 virtualization@lists.linux-foundation.org
Cc: virtio-comment@lists.oasis-open.org, stefanha@redhat.com, mst@redhat.com,
 jasowang@redhat.com
References: <ZQHPeD0fds9sYzHO@pc-79.home>
 <ed568bcf-0fc0-40f5-9cb3-14c2923f8bf7@opensynergy.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <ed568bcf-0fc0-40f5-9cb3-14c2923f8bf7@opensynergy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: virtio-sound linux driver conformance to
 spec

On 9/19/23 02:35, Anton Yakovlev wrote:
> 
> If the Linux virtio sound driver violates a specification, then there 
> must be
> a conformance statement that the driver does not follow. As far as I know,
> there is no such thing at the moment.

There is one in 2.7.13.3: "The device MAY access the descriptor chains 
the driver created and the memory they refer to immediately"

And likewise for packed virtqueues in 2.8.21.1: "The device MAY access 
the descriptor and any following descriptors the driver created and the 
memory they refer to immediately"

I think it's a mistake to use MAY here, as opposed to "may".  This is 
not an optional feature, it's a MUST NOT requirement on the driver's 
part that should be in 2.7.13.3.1 and 2.8.21.1.1.

This does not prevent the virtio-snd spec from overriding this.  If an 
override is desirable (for example because other hardware behaves like 
this), there should be a provision in 2.7.13.3.1 and 2.8.21.1.1.  For 
example:

2.7.13.3.1 Unless the device specification specifies otherwise, the 
driver MUST NOT write to the descriptor chains and the memory they refer 
to, between the /idx/ update and the time the device places the driver 
on the used ring.

2.8.21.1.1 "Unless the device specification specifies otherwise, the 
driver MUST NOT write to the descriptor, to any following descriptors 
the driver created, nor to the memory the refer to, between the /flags/ 
update and the time the device places the driver on the used ring.


In the virtio-snd there would be a normative statement like

5.14.6.8.1.1  The device MUST NOT read from available device-readable 
buffers beyond the first buffer_bytes / period_bytes periods.

5.14.6.8.1.2  The driver MAY write to device-readable buffers beyond the 
first buffer_bytes / period_bytes periods, even after offering them to 
the device.



As an aside, here are two other statements that have a similar issue:

- 2.6.1.1.2 "the driver MAY release any resource associated with that
virtqueue" (instead 2.6.1.1.1 should have something like "After a queue 
has been reset by the driver, the device MUST NOT access any resource 
associated with a virtqueue").

- 2.7.5.1 "[the device] MAY do so for debugging or diagnostic purposes" 
(this is not normative and can be just "may")


Thanks,

Paolo


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

