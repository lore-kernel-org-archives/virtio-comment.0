Return-Path: <virtio-comment-return-6953-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADD0C00528
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 08:15:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B5952157EE4
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 08:15:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9881398664C
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 08:15:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7E17E9865F7; Wed,  2 Aug 2023 08:15:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 677649865F9;
	Wed,  2 Aug 2023 08:15:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2yiIJaKCGQ3YxfB/FMaJVjCqUSzRTG00L/NYIAGMFYpFw8EHJk/MaJZp4Sb+yemqKNHWwsgOJuSd+u+G+TEzXM1ALkgkqojhFwNwcvNI3jyN8V2qfwuuUcg3/SmT4czIoTp0EWE+o2CvtG4unFgz8CLK6XxzhPRWH6zpBqb86y4+nBrrXc6d7NMdj0RfdsgMwnezbr15QWtETFv1SG17ioGShB98uuy1pNkbUjun9HG6ueSO4YGZGW3QmL+3gAh8iStafNKjQz+Al1HUjyKjXoWGBN5NkIh2A4MIiSHXCcQfUK7+UJmnSpwdUbQqA8rf4JA6NQJRZXIC5xAzwq9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/b0ZhRQUsz2mkar5pfnb4hTwQimVwkKutLv7PT1Pm2E=;
 b=ZKHT1CAaVeTf3l87bNC9+Aa758ZtEqCd2/xJs7hPxEKLFmfWwRWI7AttqB6vxxarfvVycdXHKATJrgTcTeMMqsH+vEnu9G5o5cwHntWajsh3rpzqD/hJYhpGS3F40ZQTHcIkeKtxKzA/yUsb5wbAmPPJ0ukbb2acw9AIz++Scah96NwwNd+q+HEdKYyym0F8dA6vnbhlBqIqUjPXQv/wZUBGjArlzISwneuWUDwXAI24CWixpshCVCt+B1BxwRpDSOca1V8ET+JZspAEJNL3dAv6hQqnHBs12kxwwtm7G++BextppKqMHnQYCitQt8B6AiPI+wWr9wUcWgxqCoO7Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: Shahaf Shuler <shahafs@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [EXT] [virtio] [PATCH requirements 5/7] net-features: Add
 n-tuple receive flow filters requirements
Thread-Index: AQHZvd/S1zVkOCRsJ0eCMof906XE7a/WpxoAgAABq+A=
Date: Wed, 2 Aug 2023 08:14:57 +0000
Message-ID:
 <PH0PR12MB5481B38BB328AB72B9144651DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <SJ0PR18MB44772855643A6348135CE8F1C30BA@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB44772855643A6348135CE8F1C30BA@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB7222:EE_
x-ms-office365-filtering-correlation-id: f36b8372-f5ea-4b71-5789-08db93308f8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DfBAAUSfpKr3/7MIGP8oRwxnoDkOHNlzpw2MJgQqAVEMPgjtOjf381XWSJ1s1CF7juJpe0Mins5KjeWwDoQ0PnOE7JUIYMeJcPd26870Ln5nHVJoG2x+LVUUXAXti+Yn4EinGkfBY2UkTfYbknTxcDUG/wOPThefLAt9zqk95DdhPZEgMVPww9ZPVe7rPwnOTuVpwXkMM81dEFQnmN9syuOTGkwzJ00CqhwFteXpiAUUN65A/J8xf+cWj7Yd/7LfCBOW341/NfJhdynNLmUVfpkyqin6yvH1OM+dlPnWdNLeqxNf1xJVI4767PUj6RataZDgbhrXMzTRIpAUZElwXNDXikZI3hMg+aDWMnKe0oUBR02GmFHTl1wjKlbjxfv42qDDroyRahnGQycFS4F+MwkQW43XpdKu7esTb205N+qD4Rh3C+HqWXiRIDgjqv1QAjm0Xw59YIaLlhVppFfXCnahaxR3s6imdW2x7VpUDAHCNz17MLC0QJXlzMTuCbkQc4ANP3cKzm3JeDnSDf2p8VRKEPtknZHEkQ5C2aUgt8gkiRlArvNsd0B0+/+OWzsAUq2W5ShrhONZbM3vylc0D78GhKq0EsToVoMaCJQYVMd9V+MQ43tUO7rmv8pR661m
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(26005)(186003)(83380400001)(6506007)(316002)(76116006)(66556008)(2906002)(66946007)(64756008)(66446008)(66476007)(5660300002)(4326008)(52536014)(41300700001)(8676002)(8936002)(71200400001)(7696005)(9686003)(54906003)(478600001)(110136005)(55016003)(38100700002)(122000001)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?e0If7+RC+X9r+HjbYV2VFxmi8GlrIgQqtnxTCfbM9vu1JCujX/Nfbxlq9gRx?=
 =?us-ascii?Q?XpvJU9P21xHyMHln4BVRuBEJDDQ1T8pVs/0jteCu4WWKZGXfOpRqbCrFYwLu?=
 =?us-ascii?Q?z3EJ5a0jqq28nuWI/zi6bBUKmHKykjQtgM8oL4ujDwgAhJ4bA/bmj9tFCuuD?=
 =?us-ascii?Q?jAv+weVhH9ERzxc9u3CxmcCtawVOcm3jWTDiAwt5mQEnQs4slHGIP1FbvsAo?=
 =?us-ascii?Q?WOZat2+Sek1qNWFB0YdXvY0yMg7DRKP8zGXWafLyCuLVpn+kaMv7YQ/GqQKa?=
 =?us-ascii?Q?uL6GPiJoHnTB6OX4ZMIhMalpmWqlZ0ZjHW3y30VF8G1J6ypzSEmNWbz/ZxN7?=
 =?us-ascii?Q?LiBS0baU42VsJGGIewks4hqpDhIYNExPKRme0J7iDyIKSVSQeZ2tMAG3ykXC?=
 =?us-ascii?Q?MA+sGS5XLcTxLIXuNItcrLe6ML2igE34nC0zkvQ3Ni6YymuK2mtC/nK6u/s5?=
 =?us-ascii?Q?lUjW+IpEko8xAc6xl7fcZzTnxzdwjUKBMZ63OOos8DvSJPD9iPPpBzab4iep?=
 =?us-ascii?Q?ja/7iASTJL9YbaJw/TUzta/W7bzxTbGGzPEF0PlLahqIF9RvngoNojUdBQX8?=
 =?us-ascii?Q?8A2Y6bOTqKpq1nvNI5N92Ybxp8mrJgFLoYCS50cMD+oViwH4wplzjyJqtJks?=
 =?us-ascii?Q?lD7Y1rFxeLNkKTiJ1zyNpKtk0Co4ISavedvt57b9EzHaySgQqhngKwrTkXTe?=
 =?us-ascii?Q?vaa9xbI67bP+Dyp7D0h9Gj70qvWrBjNLTmH+VwerzqTcHeM7NJkqrdr3Yz1w?=
 =?us-ascii?Q?cZUJnuTuDTcAGVw9k9n/frUJUqc6JAIr5Tax4JBmTS+CzsPhuQYeOcW5cMzt?=
 =?us-ascii?Q?JrNJWBlF9cpKaxkvfkbun+FLtidbceuuIXC/vqW7qCLiQ/w8e5fBfZ/Ih08P?=
 =?us-ascii?Q?FZnVShfwuQxI6ccowI2PN0QxEZNcwSg6Bnccejx5hdr6Hi7CfIeRsZvoePC/?=
 =?us-ascii?Q?fwqWcwt2wQ0HP18LbsrQfRaqY/qc3ScfRVnHjfH3rKdt1rB6INtYrTjKxBUR?=
 =?us-ascii?Q?nchPqc7K56fG556mPPqtZdmSjzx4tzu+nlVQ6ydoSkCGxPlVRBrDyYbLqAxB?=
 =?us-ascii?Q?MSrRGpSR8ssqendvxNDDVlDbzmGtSpuwYVd0GfgSWHIlleapWkPmfkbvLjha?=
 =?us-ascii?Q?MFwrw6BkLWLYVS1qvZg3rzWm2fgIUX4UfGT1FSns0omByDubhbiqefBEukR1?=
 =?us-ascii?Q?gjKckuX0HbV27LjGzwP6rnC+HOYtlYz78LZtdTz2VjIXTAujTxPMN1xVWcl3?=
 =?us-ascii?Q?Udvm+uYHlQ0esUf5Z+IHHrYAbKsWtxt0T58boRZCcoNzBDxpSnGV36KYclJ8?=
 =?us-ascii?Q?jHVh3mkcETcjzcQVV/ZiJCfYIC4fIF/vDTE5GfQZvRmItYA3qEwq9dWikGVl?=
 =?us-ascii?Q?NVx9i8X8RzONUA+e5XlTQGSDX9uHr+S+mvkG+o8J1g1hgnF3xdgKVx/iXrZF?=
 =?us-ascii?Q?K203PemAShxc+KRZEjZPhTAIYATrRbxBBDYBLFiuuFuZQUdBqIgmPTIh3pcg?=
 =?us-ascii?Q?a7nexV/mda9ULOSGocpvoOUJXn5rUJZHdh4gm4UlFSPmsFceNP3IuMqAWpjd?=
 =?us-ascii?Q?h7aOdTiRmdEYk+9/ptg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f36b8372-f5ea-4b71-5789-08db93308f8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 08:14:57.8579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l4Et41wTjILGjfgElQOYNi7FK8jY/eqyFj94VWuYU/RJsT0WyuVLy2UEWbkiBcVZb+Fx/7c+I1fuYfCVIG+ewA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7222
Subject: [virtio-comment] RE: [EXT] [virtio] [PATCH requirements 5/7] net-features: Add n-tuple
 receive flow filters requirements


> From: Satananda Burla <sburla@marvell.com>
> Sent: Wednesday, August 2, 2023 12:48 PM

[..]
> > +7. The device should process packet receive filters programmed via
> > control vq
> > +   commands first in the processing chain.
> > +7. The device should process RFF entries before RSS configuration,
> > i.e.,
> > +   when there is a miss on the RFF entry, RSS configuration applies
> > + if
> > it exists.
> > +8. To summarize the processing chain on a rx packet is:
> > +   {mac,vlan,promisc rx filters} -> {receive flow filters} ->
> > +{rss/hash
> > config}.
> Shouldn't this be
>                                                          |-match-> {RFF p=
rocessing}
> {mac,vlan,promisc rx filters} -> {receive flow filters} -|
>                                                          |-no match-> {rs=
s/hash config}.
I likely didn't understand your suggestion.

In the filter chain, the first filters are promiscuous, mac, vlan filters w=
hich are programmed through the cvq.
If mac filter of cvq drops the packet, packet does not reach the newly intr=
oduced RFF filter.

This is because RFF are steering rules (like RSS).
They do not override the existing mac/vlan filters from OS/driver pov.

> The above looks like RSS processing will always happen.

Oh my bad.
Rss is only on the no_match, didn't clarify enough.

Fixing it.

> > +9. If multiple entries are programmed which has overlapping
> > +attributes
> > for a
> > +   received packet, the driver to define the location/priority of the
> > entry.
> If driver does not provide group or provides same group with 2 rules that=
 have a
> same match part, does the new entry overwrite the old one for exact
> matches(no mask) ? and for rules with masks, does the rule with longest m=
atch
> take precedence? or the latest added rule takes precedence?
> > +10. The filter entries are usually short in size of few tens of bytes,
> > +   for example IPv6 + TCP tuple would be 36 bytes, and ops/sec rate is
> > +   high, hence supplying fields inside the queue descriptor is
> > preferred for
> > +   up to a certain fixed size, say 56 bytes.
> > +11. A flow filter entry consists of (a) match criteria, (b) action,
> > +    (c) destination and (d) a unique 32 bit flow id, all supplied by
> > the
> > +    driver.
> > +12. The driver should be able to query and delete flow filter entry
> > +by
> > the
> > +    the device by the flow id.
> The flowid here seems to be used for rule index. Can this be returned by =
the
> device instead of being sent by driver? A 32 bit value to store might imp=
ose
> undue restrictions on devices that have lesser capacity. Or could there b=
e a
> restriction that flowid cannot exceed the value returned by device as the
> capacity.
> > +
I had thought about it as well.
The main reason for driver to choose the value is, live migration scenario.
If the device chooses _any_ id, then one vendor may choose A and other vend=
or may choose B and it may not work.

So one way is to keep driver supplied id we need to keep it detached from t=
he capacity.

Alternatively,=20
we can add max_value in the device provisioning flow to ease the device imp=
lementation.
Like how we have max_vqs per device (num_queues in virtio_pci_common_cfg).

(max capacity is already present in below flow_filter_capabilities struct).

> > +### 3.4.3 interface example
> > +
> > +Flow filter capabilities to query using a DMA interface:
> > +
> > +```
> > +struct flow_filter_capabilities {
> > +	u8 flow_groups;
> > +	u16 num_flow_filter_vqs;
> > +	u16 start_vq_index;
> > +	u32 max_flow_filters_per_group;
> > +	u32 max_flow_filters;
> > +	u64 supported_packet_field_mask_bmap[4];
> > +};
> > +
> > +
> > +```
> > +
> > +1. Flow filter entry add/modify, delete:
> > +
> > +struct virtio_net_rff_add_modify {
> > +	u8 flow_op;
> > +	u8 group_id;
> > +	u8 padding[2];
> > +	le32 flow_id;
> > +	struct match_criteria mc;
> > +	struct destination dest;
> > +	struct action action;
> > +
> > +	struct match_criteria mask;	/* optional */
> > +};
> > +
> > +2. Flow filter entry delete:
> > +struct virtio_net_rff_delete {
> > +	u8 flow_op;
> > +	u8 group_id;
> > +	u8 padding[2];
> > +	le32 flow_id;
> > +};
> > --
> > 2.26.2
> >

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

