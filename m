Return-Path: <virtio-comment-return-3250-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 71DCD98652F
	for <virtio-comment@lists.oasis-open.org>; Thu, 28 Jul 2022 11:29:00 +0000 (UTC)
Date: Thu, 28 Jul 2022 07:28:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20220728072137-mutt-send-email-mst@kernel.org>
References: <20220701132826.8132-1-lingshan.zhu@intel.com>
 <20220701132826.8132-5-lingshan.zhu@intel.com>
 <PH0PR12MB548190DE76CC64E56DA2DF13DCBD9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <00889067-50ac-d2cd-675f-748f171e5c83@oracle.com>
 <63242254-ba84-6810-dad8-34f900b97f2f@intel.com>
 <8002554a-a77c-7b25-8f99-8d68248a741d@oracle.com>
 <c8bd5396-84f2-e782-79d7-f493aca95781@redhat.com>
 <f3fd203d-a3ad-4c36-ddbc-01f061f4f99e@oracle.com>
 <CACGkMEtvVOtqAgY4Yzt_4=t8yfGJho4d9C=X8MQhW0ZKw1sDNA@mail.gmail.com>
 <2dfff5f3-3100-4a63-6da3-3e3d21ffb364@oracle.com>
MIME-Version: 1.0
In-Reply-To: <2dfff5f3-3100-4a63-6da3-3e3d21ffb364@oracle.com>
Subject: [virtio-comment] Re: spec clarification (was Re: [PATCH V3 4/6] vDPA: !FEATURES_OK
 should not block querying device config space)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, Parav Pandit <parav@nvidia.com>, Eli Cohen <elic@nvidia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "xieyongji@bytedance.com" <xieyongji@bytedance.com>, "gautam.dawar@amd.com" <gautam.dawar@amd.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, virtio-comment@lists.oasis-open.org, virtio@lists.oasis-open.org, Paolo Bonzini <pbonzini@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jul 28, 2022 at 01:20:26AM -0700, Si-Wei Liu wrote:
> Hi Michael,
> 
> Could you please comment on the different wording between "exist" and "valid"
> in spec? Having seen quite a few relevant discussions regarding MTU validation
> and VERSION_1 negotiation on s390, I was in the impression this is not the
> first time people getting confused because of ambiguity of random wording
> without detailed example helping to clarify around the context, or due lack of
> clear definition set ahead. I like your idea to keep things consistent
> (conditional depending on feature presence), however, without proper
> interpretation of how spec is supposed to work, we are on a slippery slope
> towards inconsistency.
> 
> On 7/28/2022 12:36 AM, Jason Wang wrote:
> 
>         And looking at:
> 
>         "The mac address field always exists (though is only valid if
>         VIRTIO_NET_F_MAC is set), and status only exists if VIRTIO_NET_F_STATUS
>         is set."
> 
>         It appears to me there's a border line set between "exist" and "valid".
>         If I understand the spec wording correctly, a spec-conforming device
>         implementation may or may not offer valid status value in the config
>         space when VIRTIO_NET_F_STATUS is offered, but before the feature is
>         negotiated.
> 
>     That's not what I read, maybe Michael can clarify this.
> 
> 
> 
> And Jason and I find below normatives are conflict with each other.
> 
>         "The device MUST allow reading of any device-specific configuration
>         field before FEATURES_OK is set by the driver. This includes fields
>         which are conditional on feature bits, as long as those feature bits are
>         offered by the device."


So I proposed this back in April:

https://lists.oasis-open.org/archives/virtio-comment/202201/msg00068.html

I intended this for 1.2 but it quickly became clear it won't make it
in time. Working on reviving the proposal and addressing the comments.




> 
>     ...
> 
>         And also there are special cases where the read of specific
>         configuration space field MUST be deferred to until FEATURES_OK is set:
> 
>         "If the VIRTIO_BLK_F_CONFIG_WCE feature is negotiated, the cache mode
>         can be read or set through the writeback field. 0 corresponds to a
>         writethrough cache, 1 to a writeback cache11. The cache mode after reset
>         can be either writeback or writethrough. The actual mode can be
>         determined by reading writeback after feature negotiation."
>         "The driver MUST NOT read writeback before setting the FEATURES_OK
>         device status bit."
> 
>     This seems to conflict with the normatives I quoted above, and I don't
>     get why we need this.
> 
> 
> 
> Thanks,
> -Siwei


The last one I take to mean writeback is special.
I am not sure why it should be. Paolo you proposed this text could
you comment please?

Thanks!

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

