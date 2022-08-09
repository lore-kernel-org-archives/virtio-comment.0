Return-Path: <virtio-comment-return-3341-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 27F1E986304
	for <virtio-comment@lists.oasis-open.org>; Tue,  9 Aug 2022 09:31:48 +0000 (UTC)
MIME-Version: 1.0
References: <20220805095343.486546-1-lingshan.zhu@intel.com>
 <20220805095343.486546-2-lingshan.zhu@intel.com> <CACGkMEt7uCOKrnxJMBMFbRtKicH42eHPBOuODao33XCEvRY=Ow@mail.gmail.com>
 <1f82b84c-db9d-69c1-6a41-a4573036ce0c@intel.com> <20220809050941-mutt-send-email-mst@kernel.org>
 <d902070c-34dc-0a0d-d0b7-04ed10ad8670@intel.com> <CACGkMEv1SQg=PB7G+OdYvVZ2-TgkVu5givfNMUdnRwGtTzfPKw@mail.gmail.com>
 <0bc52b68-0e7c-4324-c7b5-8867561540a4@intel.com>
In-Reply-To: <0bc52b68-0e7c-4324-c7b5-8867561540a4@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Aug 2022 17:31:32 +0800
Message-ID: <CACGkMEt-SQ-Q8RE1b_d2Lfh6QbOYVAmphOHGeQj5Ni1P8PeNAw@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH V3 RESEND 1/4] Introduce virito transport virtqueue
Content-Type: text/plain; charset="UTF-8"
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, nrupal.jani@intel.com, "Uminski, Piotr" <Piotr.Uminski@intel.com>, hang.yuan@intel.com, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Aug 9, 2022 at 5:28 PM Zhu, Lingshan <lingshan.zhu@intel.com> wrote:
>
>
>
> On 8/9/2022 5:21 PM, Jason Wang wrote:
> > On Tue, Aug 9, 2022 at 5:19 PM Zhu, Lingshan <lingshan.zhu@intel.com> wrote:
> >>
> >>
> >> On 8/9/2022 5:12 PM, Michael S. Tsirkin wrote:
> >>> On Tue, Aug 09, 2022 at 04:36:43PM +0800, Zhu, Lingshan wrote:
> >>>>>> +
> >>>>>> +A device that offers feature bit VIRTIO_F_TRANSPT_VQ and a transport virtqueue is a management device.
> >>>>>> +It processes the commands through the transport virtqueue commands.
> >>>>> I think we need to be verbose here, e.g what did those transport
> >>>>> virtqueue commands do? What's the relationship between management
> >>>>> device and managed device?
> >>>> I will add an overview of the transport virtqueue commands here, and a
> >>>> description of the relationship in the "managed device" section.
> >>> Transport is fine but management of devices is clearly something
> >>> nvidia's patches do. So I think it's best to reuse the concept of device
> >>> groups for this, from Max's patchset. Let's not replicate that work at
> >>> least. I promised Max to help a bit with wording so I'll soon send a
> >>> revision of his patchset, the generic part about device group
> >>> from which you should be able to reuse.
> >> Of course, it is possible to add the device groups in this series for sure.
> >>
> >> What I don't understand is: what kind of commands against a device
> >> group? Destroy all?
> >> And normally a parent device only support one kind of devices, like a
> >> SRIOV capable
> >> virtio-net PF only supports virtio-net VFs on it, and maybe there will
> >> not be
> >> a device support both SIOV and SRIOV, it is complex in the HW
> >> implementation.
> > For having backward compatibility? (E.g for platforms that don't support SIOV)
> >
> > Thanks
> If not a device model like SIOV which does not have a dedicated physical
> transport layer,
> the question would be: Why do we need a side channel for a VF? This
> looks conflicts with
> VF provisioning and virtio-spec definitions. E.g, why allow changing MSI
> in the flight
> outside the guest control?

Just to clarify my points. I meant that vendors may choose to
implement both SRIOV and SIOV in the hardware. And I believe this is
what most vendor will do.

But it doesn't mean the control path needs to be shared.

Thanks

>
> Thanks,
> Zhu Lingshan
> >
> >> Thanks,
> >> Zhu Lingshan
> >>
>


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

