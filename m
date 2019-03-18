Return-Path: virtio-comment-return-706-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 43626985BEC
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Mar 2019 22:44:55 +0000 (UTC)
Date: Mon, 18 Mar 2019 18:44:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190318184312-mutt-send-email-mst@kernel.org>
References: <54DB94AE64EDA14BAB6A1E9641A26B011AC7DF08@hasmsx109.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54DB94AE64EDA14BAB6A1E9641A26B011AC7DF08@hasmsx109.ger.corp.intel.com>
Subject: Re: [virtio-comment] virtio_blk_req.data size - Section 5.2.6 -
 version 1.1 draft 01
To: "Savir, Gil" <gil.savir@intel.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Mar 05, 2019 at 04:18:10PM +0000, Savir, Gil wrote:
> In version 1.1 draft 01 - Section 5.2.6 - struct virtio_blk_req definition:
> 
> Data field is defined as array of 512 Byte entries as follows:
> 	u8 data[][512];
> It makes sense for IN and OUT requests, since defined for read/write sizes that are 512 Bytes multiplication.
> However, it is confusing when used for DISCARD or WRITE_ZEROES requests, since virtio_blk_discard_write_zeroes struct size is 16 Bytes.
> 
> Is implying that DISCARD and WRITE_ZEROES requests must use data-field sizes that are 512 Bytes multiplication as well?
> 
> If yes, than the device can't tell how many virtio_blk_discard_write_zeroes structs reside within data-field. In that case - indication for number of virtio_blk_discard_write_zeroes structs needs to be added.
> 
> If not, then I suggest to add to the spec clarification, that for DISCARD or WRITE_ZEROES requests, data-field is not required to be with size that is 512 Bytes multiplication.
> 
> 
> Thanks,
> Gil
> 

Thanks for the report.

I think this was resolved as part of resolution of
https://github.com/oasis-tcs/virtio-spec/issues/34


> ---------------------------------------------------------------------
> Intel Israel (74) Limited
> 
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
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
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/

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

