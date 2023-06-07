Return-Path: <virtio-comment-return-6197-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C935C7EE2F
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 02:50:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A5CBB190909
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 02:50:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9718298664A
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 02:50:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8ECBE98381B; Wed,  7 Jun 2023 02:50:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 426B0986603
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 02:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: GLS6wZsTMKKKjYHqsSKKwA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686106190; x=1688698190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfaM/+g/BkM+IV8Geq+6kgf++cxqh7QYeNXgvRjPynY=;
        b=XVcQytFhdWMvGF/UFIpwqJCWKiE6WwB5o5H9xXep19nzbXAWYAieCrRLPbD1UUmMlM
         b2+0aZX2oVDYE6+Q4ednonLcllBFoInpjEmWTsKM/vkJGwfOMOn/o/+qteow8HzuhlAG
         9moAAixSO9UKX0E82Td3egdWbN4JSiWMzNrqm4nNmL/pwczY8uwQ1oi1UnqDffXyo9zT
         QEVhUsybeVPKjrkiab7CxZRYLs18MjLFUV4iNxwlszZHQ5F5V12fs2Hxnpr860ZUK3YK
         Txyhl7hPEJNMFN1A6SoDUg3sPM1WV1cc23LJ2U2QczfKCPD07/ZZOGXI0HX5tSWG0yne
         lRcw==
X-Gm-Message-State: AC+VfDy/2fl8WSh/o5r0rSxwr1rdgBi6FT+Ns4d+AzJaAudcqZ7XeqoE
	oyVxqiVWnEHmaBG4++6+2KO1Sl0OEpsIb9Wop8LshaXk7m/dR+8Uirpt8Ps7JTBziamztWgcr5O
	YOpAgRqyoRAE989EUppTMto9IET7COsN8kyK27ZZWCslxzUA4wqqsdgldNpTNyHk=
X-Received: by 2002:a2e:8195:0:b0:2b0:5a04:a5bd with SMTP id e21-20020a2e8195000000b002b05a04a5bdmr1842210ljg.42.1686106190336;
        Tue, 06 Jun 2023 19:49:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7q5sFNqMXfUT3ToAgoGBHcOEMv9neCcs3BA9LGwjhdLPbbOjhUyyw5omENiaWJAcTo7iIpLGKODQPkP69UVa0=
X-Received: by 2002:a2e:8195:0:b0:2b0:5a04:a5bd with SMTP id
 e21-20020a2e8195000000b002b05a04a5bdmr1842205ljg.42.1686106190062; Tue, 06
 Jun 2023 19:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230601220305.587034-1-parav@nvidia.com>
In-Reply-To: <20230601220305.587034-1-parav@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 7 Jun 2023 10:49:39 +0800
Message-ID: <CACGkMEsqPFOGPWFKeqMZD-Uj2P5qDYK_FGc2w0ri+0LsQ1N1dA@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, shahafs@nvidia.com, 
	virtio@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH requirements 0/7] virtio net new features requirements

On Fri, Jun 2, 2023 at 6:03=E2=80=AFAM Parav Pandit <parav@nvidia.com> wrot=
e:
>
> Hi All,
>
> This document captures the virtio net device requirements for the upcomin=
g
> release 1.4 that some of us are currently working on.
>
> I would like to capture if there are any other requirements linked to the
> features captured in this document to consider in the interface design.
>
> The objectives are:
> 1. to consider these requirements in introducing new features
> listed in the document and work towards the interface design followed
> by drafting the specification changes.
>
> 2. Define practical list of requirements that can be achieved in 1.4
> timeframe incrementally and also have the ability to implement them.
>
> This is not a specification document. It is a pre-work document
> that helps to understand the draft specification addressing these
> requirements.
>
> Please review.
>
> Parav Pandit (7):
>   net-features: Add requirements document for release 1.4
>   net-features: Add low latency transmit queue requirements
>   net-features: Add low latency receive queue requirements
>   net-features: Add notification coalescing requirements
>   net-features: Add n-tuple receive flow steering requirements
>   net-features: Add packet timestamp requirements
>   net-features: Add header data split requirements
>
>  net-workstream/features-1.4.md | 224 +++++++++++++++++++++++++++++++++

I feel that some patches go into too many details of the proposed
solution which makes it more like RFC instead of a requirement.

It would be easier to start with to describe why a feature is needed
and why it can't work well in current spec.

Thanks

>  1 file changed, 224 insertions(+)
>  create mode 100644 net-workstream/features-1.4.md
>
> --
> 2.26.2
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

