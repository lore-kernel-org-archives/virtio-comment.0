Return-Path: <virtualization-bounces@lists.linux-foundation.org>
Message-ID: <2dfff5f3-3100-4a63-6da3-3e3d21ffb364@oracle.com>
Date: Thu, 28 Jul 2022 01:20:26 -0700
Subject: spec clarification (was Re: [PATCH V3 4/6] vDPA: !FEATURES_OK should
 not block querying device config space)
Content-Language: en-US
References: <20220701132826.8132-1-lingshan.zhu@intel.com>
 <20220701132826.8132-5-lingshan.zhu@intel.com>
 <PH0PR12MB548190DE76CC64E56DA2DF13DCBD9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <00889067-50ac-d2cd-675f-748f171e5c83@oracle.com>
 <63242254-ba84-6810-dad8-34f900b97f2f@intel.com>
 <8002554a-a77c-7b25-8f99-8d68248a741d@oracle.com>
 <c8bd5396-84f2-e782-79d7-f493aca95781@redhat.com>
 <f3fd203d-a3ad-4c36-ddbc-01f061f4f99e@oracle.com>
 <CACGkMEtvVOtqAgY4Yzt_4=t8yfGJho4d9C=X8MQhW0ZKw1sDNA@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
In-Reply-To: <CACGkMEtvVOtqAgY4Yzt_4=t8yfGJho4d9C=X8MQhW0ZKw1sDNA@mail.gmail.com>
MIME-Version: 1.0
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7722777312296396865=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>
To: Jason Wang <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, virtio-comment@lists.oasis-open.org, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "xieyongji@bytedance.com" <xieyongji@bytedance.com>, "gautam.dawar@amd.com" <gautam.dawar@amd.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>, virtio@lists.oasis-open.org, Eli Cohen <elic@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--===============7722777312296396865==
Content-Type: multipart/alternative;
 boundary="------------WDzLQcrmCNlMb0eWacTVI30R"
Content-Language: en-US

--------------WDzLQcrmCNlMb0eWacTVI30R
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael,

Could you please comment on the different wording between "exist" and 
"valid" in spec? Having seen quite a few relevant discussions regarding 
MTU validation and VERSION_1 negotiation on s390, I was in the 
impression this is not the first time people getting confused because of 
ambiguity of random wording without detailed example helping to clarify 
around the context, or due lack of clear definition set ahead. I like 
your idea to keep things consistent (conditional depending on feature 
presence), however, without proper interpretation of how spec is 
supposed to work, we are on a slippery slope towards inconsistency.

On 7/28/2022 12:36 AM, Jason Wang wrote:
>> And looking at:
>>
>> "The mac address field always exists (though is only valid if
>> VIRTIO_NET_F_MAC is set), and status only exists if VIRTIO_NET_F_STATUS
>> is set."
>>
>> It appears to me there's a border line set between "exist" and "valid".
>> If I understand the spec wording correctly, a spec-conforming device
>> implementation may or may not offer valid status value in the config
>> space when VIRTIO_NET_F_STATUS is offered, but before the feature is
>> negotiated.
> That's not what I read, maybe Michael can clarify this.
>

And Jason and I find below normatives are conflict with each other.
>> "The device MUST allow reading of any device-specific configuration 
>> field before FEATURES_OK is set by the driver. This includes fields 
>> which are conditional on feature bits, as long as those feature bits 
>> are offered by the device." 
> ...
>> And also there are special cases where the read of specific
>> configuration space field MUST be deferred to until FEATURES_OK is set:
>>
>> "If the VIRTIO_BLK_F_CONFIG_WCE feature is negotiated, the cache mode
>> can be read or set through the writeback field. 0 corresponds to a
>> writethrough cache, 1 to a writeback cache11. The cache mode after reset
>> can be either writeback or writethrough. The actual mode can be
>> determined by reading writeback after feature negotiation."
>> "The driver MUST NOT read writeback before setting the FEATURES_OK
>> device status bit."
> This seems to conflict with the normatives I quoted above, and I don't
> get why we need this.
>

Thanks,
-Siwei
--------------WDzLQcrmCNlMb0eWacTVI30R
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Michael,<br>
    <br>
    Could you please comment on the different wording between &quot;exist&quot;
    and &quot;valid&quot; in spec? Having seen quite a few relevant discussions
    regarding MTU validation and VERSION_1 negotiation on s390, I was in
    the impression this is not the first time people getting confused
    because of ambiguity of random wording without detailed example
    helping to clarify around the context, or due lack of clear
    definition set ahead. I like your idea to keep things consistent
    (conditional depending on feature presence), however, without proper
    interpretation of how spec is supposed to work, we are on a slippery
    slope towards inconsistency.<br>
    <br>
    <div class="moz-cite-prefix">On 7/28/2022 12:36 AM, Jason Wang
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CACGkMEtvVOtqAgY4Yzt_4=t8yfGJho4d9C=X8MQhW0ZKw1sDNA@mail.gmail.com">
      <blockquote type="cite" style="color: #007cff;">
        <pre class="moz-quote-pre" wrap="">And looking at:

&quot;The mac address field always exists (though is only valid if
VIRTIO_NET_F_MAC is set), and status only exists if VIRTIO_NET_F_STATUS
is set.&quot;

It appears to me there's a border line set between &quot;exist&quot; and &quot;valid&quot;.
If I understand the spec wording correctly, a spec-conforming device
implementation may or may not offer valid status value in the config
space when VIRTIO_NET_F_STATUS is offered, but before the feature is
negotiated.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">That's not what I read, maybe Michael can clarify this.

</pre>
    </blockquote>
    <br>
    And Jason and I find below normatives are conflict with each other.<br>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite">
&quot;The device MUST allow reading of any device-specific configuration 
field before FEATURES_OK is set by the driver. This includes fields 
which are conditional on feature bits, as long as those feature bits are 
offered by the device.&quot;


</blockquote>...
</pre>
      <blockquote type="cite" style="color: #007cff;">
        <pre class="moz-quote-pre" wrap="">And also there are special cases where the read of specific
configuration space field MUST be deferred to until FEATURES_OK is set:

&quot;If the VIRTIO_BLK_F_CONFIG_WCE feature is negotiated, the cache mode
can be read or set through the writeback field. 0 corresponds to a
writethrough cache, 1 to a writeback cache11. The cache mode after reset
can be either writeback or writethrough. The actual mode can be
determined by reading writeback after feature negotiation.&quot;
&quot;The driver MUST NOT read writeback before setting the FEATURES_OK
device status bit.&quot;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">This seems to conflict with the normatives I quoted above, and I don't
get why we need this.

</pre>
    </blockquote>
    <br>
    Thanks,<br>
    -Siwei<br>
  </body>
</html>

--------------WDzLQcrmCNlMb0eWacTVI30R--

--===============7722777312296396865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7722777312296396865==--
