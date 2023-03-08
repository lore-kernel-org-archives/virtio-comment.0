Return-Path: <virtio-comment-return-4814-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0113BC64EC4
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 17:23:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 47C6AF64
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 17:23:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 428619866F7
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 17:23:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3B12F9866F0; Wed,  8 Mar 2023 17:23:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 279859866F2
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Mar 2023 17:23:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: rYA0XynlNgKKt5wH0F4yhg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678296178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OQO6vgGRjx8r4UFBXDsH+HBJVJjmFXAW0zNX8/IUZ4=;
        b=B3gZIXNhJa2zKne/eC/wrqHfFyoqN/Ze5ENLFGQj6cnoTOX0QbH2CdVcdU4iv+Ncx4
         2SOdPaDisG+N2dbyRnLm7/LRCas6SDPo9fVpRxoY325+MR/nfp+Hf2DWHmoI0hO33NTk
         jDjNTl+UmhFoPOtS04QAh0/LXSGIVbeKIsaUBvvbDjCb/M7ByJ9zV423TAQ0D5kVVIgx
         JqNKLTOJbiaRBIN1M6s1u4S6EmK3lFmr28RyP0ehWjgAOkz7KLq67hxxRauF9YIBeZ4S
         MmSn30dld0upi7x8wUOSG9htkmlKUR1ydfm6wWnQTSQPLnZuHjnnXPFg9hagfOkt7eyu
         shVA==
X-Gm-Message-State: AO0yUKWvUDF06mkdjBIN/HWwD71+cjPyBtsZS1Z8wzK8/dsutFNYatXR
	rx/7cS12QAr5sM7SPaBTd1Os4llyQ3oNxUjwSDeEcRglqhfygtUep8vq7zD5bDyqaKpixUTpOCS
	NIpir9xEO5HefPpLYwLmxj+i7FLqN4oVavQ==
X-Received: by 2002:a05:600c:4e92:b0:3e2:5c3:bcfc with SMTP id f18-20020a05600c4e9200b003e205c3bcfcmr17529171wmq.18.1678296178519;
        Wed, 08 Mar 2023 09:22:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9As+i5DmiEyKgFyRyta7AH9zHOZPebPiqBk/O2udiLqjXc+UIX9LjWwbID51UwaBocFDsBOA==
X-Received: by 2002:a05:600c:4e92:b0:3e2:5c3:bcfc with SMTP id f18-20020a05600c4e9200b003e205c3bcfcmr17529149wmq.18.1678296178204;
        Wed, 08 Mar 2023 09:22:58 -0800 (PST)
Date: Wed, 8 Mar 2023 12:22:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Jiri Pirko <jiri@nvidia.com>, virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org, jasowang@redhat.com,
	sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com,
	virtio@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>,
	pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
	Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230308122220-mutt-send-email-mst@kernel.org>
References: <cover.1677761896.git.mst@redhat.com>
 <ZAXcqqdwfoLokT2l@nanopsycho>
 <20230306175020-mutt-send-email-mst@kernel.org>
 <877cvrkxxj.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <877cvrkxxj.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v10 00/10] Introduce device group and
 device management

On Wed, Mar 08, 2023 at 05:30:48PM +0100, Cornelia Huck wrote:
> On Mon, Mar 06 2023, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Mon, Mar 06, 2023 at 01:29:30PM +0100, Jiri Pirko wrote:
> >> Thu, Mar 02, 2023 at 02:04:48PM CET, mst@redhat.com wrote:
> >> 
> >> [...]
> >> 
> >> >
> >> >TODO (maybe?) - probably ok to defer until this part is upstream:
> >> >
> >> >	Add "all members" member id.
> >> >
> >> >	Add commands for MSI, feature discovery.
> >> >
> >> >	Add commands for transport vq.
> >> >
> >> >
> >> >My intent is to try and support both SR-IOV and SIOV
> >> >usecases with the same structure and maybe even the same
> >> >VQ.
> >> 
> >> Sorry to be late to the party, I'm trying to catch up. Is it common to
> >> have cover letter for features this brief? I mean, from the cover
> >> letter, I'm totally unable to understand what you are introducing here.
> >> 
> >> Could you elaborate about what you are aiming to achive with this?
> >> Could you shed some usecases perhaps?
> >> 
> >> I have to be missing something obvious, but I don't get why any notion
> >> of SR-IOV could be beneficial for virtio.
> >> 
> >
> > Good point, I'll add a bit of motivation.
> >
> > For SR-IOV, it is not unusual for PFs to excercise control over VFs.
> > There is interest in the community to include an interface to allow this
> > in the virtio spec, when the PF is a virtio device.  This is what this
> > patch does.
> 
> Unfortunately, information in the cover letter does not make it into
> git -- should things like that go into the github issue (and into the
> ballot?) It's useful both for reviewing (cover letter) and understanding
> the rationale later (github/ballot).

Well the github issue has a link to the archives, but sure it's
possible to copy that.

-- 
MST


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

