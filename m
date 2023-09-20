Return-Path: <virtio-comment-return-7484-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4292DCE79AD
	for <virtio-comment@archiver.kernel.org>; Wed, 20 Sep 2023 04:53:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7556C8504F
	for <virtio-comment@archiver.kernel.org>; Wed, 20 Sep 2023 04:53:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 57AC598666C
	for <virtio-comment@archiver.kernel.org>; Wed, 20 Sep 2023 04:53:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3D756983DFC; Wed, 20 Sep 2023 04:53:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2F7A6986656
	for <virtio-comment@lists.oasis-open.org>; Wed, 20 Sep 2023 04:53:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnj424BfqM0zzbmx10gK5DIGofKBUuN10/SXY0HMJEcOF7arvazO19+Jclezir4K8mxffOdXI2iMiPguq5o5JZd+HscPtIkTDOZW1i147vpKRGzT9yuXDT0JF/JVZJcJkpNEOqY9lFd6ezxlPGBJ6WEtx3nEJ5EiyGZZPAaaycifV52BtXI/jAVX5tmYwip5mvG31skoqE/UTfL3IfStvvz2J28SQ8oCCUzPJecNfg9SJQMyfIOx8TA7005oZ0GrKA/Abb4eqoAhr2wHhdkojgzGxgFHU3qYUeFXVDuMyRCS6kzbdEszsgjDD6dDhr9SpZ4Xnn+vtyYsLa6yO2oygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xebebrd5XLfN/MqWMR22k+8aq7GAsj+jrQNHEolvd1I=;
 b=lKNwRpRM2CLyG3bxpD81Kn8iUNaPHfUqOuKZEmLOXxTHlX3ptIK3uRZcHy+ywG6tAujjQLi0/htj1qzbf7K6SO9C9bBG6Hw75EAdrw8yGqKwf+I4MDeHA2YVADBE2VBpBA6fFqxDEppwmeZ7X36ge34MIlGY+oBa8PIIJLU2Zr6u9tYpUPuKGUmvigHWaBOn+hkV5piCbzNRxenk+EoXcgdd/iQkqsXwx7K9AIXqLupFwm6gqI/xw1NoTyAjTg6F0wsoetxZXOz5xx82DQ10ENNLS8WSPqwy8ZT2Q9NWeESKbzTgsh3+aM8ZUfQvnPRRgboq6yUuBWzQDZmWutwQfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, David Edmondson <david.edmondson@oracle.com>
Thread-Topic: [PATCH v18] virtio-net: support device stats
Thread-Index: AQHZ6r+MNcqsK04JW0eobyJ1OnGbgbAjJjPw
Date: Wed, 20 Sep 2023 04:52:57 +0000
Message-ID:
 <PH0PR12MB5481B96A23D69557C9E12C56DCF9A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230919060710.36535-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20230919060710.36535-1-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB9194:EE_
x-ms-office365-filtering-correlation-id: 95ff615e-230b-411c-df4f-08dbb9957584
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ldgB+5VmlxpUkuf+0Ohy5sjElWr5eWGXEiOojmmXD/8Qpbl7402SYpkFhN3r2Aj4JwKghB8cVeWw2+GJghL973mmexyznq2owmstPzHQ9lKzADlrH1FvEbKTJq5ik7815jjrRPh9eEZWeUpDbPDD8XTwE7aripXesOUzYeKK8R0Na3vjUpQVQWt/fkIuzoyTcWyeu1oHCa/iZCHwRmiwRrYfea2ojkRc0n6WOdkhr0uyqotKxxTHbuwyNZizyNvq4m8TNd4LnsU5cQOLQzLkQR5c63T+3mdenU22PxCH4qupvRuYK58O84EhlmASQlh533miWSj8IFy7rsjNOoAkfznp9rwM3rsB91FNPTANSuoohlua9zUoAoAT0lHJvzvJxHCg3E7ZVQ4htAmllv0kxZQ9SDTBwKc7MmsptkDqsacj7cXnrVT2i8W/PPUyzb9YpuZQmn894XxQwnTWt2nmvxHE4y3UqZq95cbyJFPYnW3h/gKtAOPeGqXY40OeELbzpyus/zjJQm4jPEbvYl9mqcicfwcG6K70ikdKqjeB1k2K6BvytiLblAhAHpss8rqoyPYdiPo6Iv3t34Hjt98M0l6QqLX3L54d3cKyghbE2qU2w4Zc/p+Bc8QinwyrYxvn
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(346002)(136003)(366004)(186009)(451199024)(1800799009)(26005)(6506007)(9686003)(7696005)(122000001)(86362001)(38100700002)(33656002)(38070700005)(55016003)(110136005)(52536014)(5660300002)(478600001)(41300700001)(54906003)(66476007)(66446008)(66946007)(76116006)(64756008)(316002)(4744005)(4326008)(8676002)(8936002)(66556008)(2906002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IRqk1BV+1w5DO5q1Dxw6jBU5NOEOdOmUEFT6LytUoPyjfryO+WBKV+Ej/y3O?=
 =?us-ascii?Q?1GUqN1rdmm/qI2ozd+XSkr72B42Sl39euuaMs6IBksAr1h0dgatUoBSK7Dhd?=
 =?us-ascii?Q?Pi3JrMrsK+kPfHOFmYG8SuzFx9i51IHWsRPiA6OfqYaFW277dnjWp+b2am+P?=
 =?us-ascii?Q?kaHvTnQq2JIZjjfV8/Hcvc35As8Eprsx3/HmW0tNQGlZw2SEE6ZVftwac2oO?=
 =?us-ascii?Q?MdZdm7P7ImSsXF3IBe2j6AO7sstNd21xaDGKjMAn2iRhM5o2c2HEHA0sP15q?=
 =?us-ascii?Q?8zHJNeLl6xWBqUHz+VfK9TnNhQhzAciwO//fZgwFn4Gd44MnZp2IXG3BRP/b?=
 =?us-ascii?Q?gS1bD4B8zI7FdEs7TbW2oCPkaZmSStoURS5UQmILvF0NHopFru1VP1sC9y+A?=
 =?us-ascii?Q?4fF+o3cmz8bKY7QpXsOwHjI2nKRmZTYIcZHcOM9l7fdjm9NYBZVu+QAU87iJ?=
 =?us-ascii?Q?MLx+rm6UWUlkQhdaw/9g3uv6Z72tkpYe6ywqNh9QEh4a8IFyYzyOhNZOV82A?=
 =?us-ascii?Q?PMcwahdC+B4IKs0rUfw7Uw6omFS4Fcju/LyOl/XSYyvcj5WMJmmkVRe/xP2M?=
 =?us-ascii?Q?j2STNDzM+VUARD/wZew77VJVOH1qufR6AIBa0GOlYeKnwOo/qylfGfc4s74U?=
 =?us-ascii?Q?w4xZrUgRzJL5GwEfTKVaZqT1UjJ4jbbT2mvMvK8jxEA/fUn1pyhJOPbgzDBl?=
 =?us-ascii?Q?DwxzKuId145qoMt0AhUUzu9T6F0cjFc42Ouftuh8FuwqlJwXeLDWp+9nSo9m?=
 =?us-ascii?Q?KL8plkXF1D4Kqnsybzl80ceTzC4T9w6RcfzfMOdC2nThnd9Q37DBDf44zvg7?=
 =?us-ascii?Q?aJUFHOOPK94PW2EGK2jEnQSyDyo4OxctHXvO9CpvlmFJ0VaeHSLM6s3KU/T3?=
 =?us-ascii?Q?Ga3wHfAuT/ords/OHUFq4qtogyqK8TgoIyRXTVYPMN8vGLd/PzbZf1y3Gm6p?=
 =?us-ascii?Q?CJXe9uvIdgC/dmlKyxAYK/sp3smlnk99YY0M6QgBdqoNGaDLKKM98YGWCoYb?=
 =?us-ascii?Q?+XqXjWBCdSSWQb0qrDPfCoWam6vXa0/3zIIYNRL6J1khaLRtxAsGuyZT2elW?=
 =?us-ascii?Q?Kis6Nstvw7DT8T/diT5vJmaujWnTPn31Ig2X7ar7QkwOGV0GkW+yOXfyAeeS?=
 =?us-ascii?Q?JXfu7jWBnAR7zsiMl5KvXJpuYxzOJPkPKAjaRoah7cFjAAtWumCyzLLKsPHU?=
 =?us-ascii?Q?VvIB27PM1Gk3VMgk7o+i432N++WiyM/mINRWFyPS7SA2QtBFcbFHBPlSv501?=
 =?us-ascii?Q?dGQaaNNO/5jMDbeKxkgN1RoBbirBxQnA9DyTMrJeH2iqzPDanB734QzpoK4u?=
 =?us-ascii?Q?LRbYVlpIHvdDxOYrHnIDQSLn1akWCzpqTshBpJyJSDsR+fV2ZFakxMnQhya+?=
 =?us-ascii?Q?cwUywT/+kxRsSRPPfMYzP2FdZrEXP3okmbeipweljahrhOTCn4g30CYynqW/?=
 =?us-ascii?Q?lHHbJAmLnFUNk/h9oJzqeDYjcF9uZ3qOpmjdzTe7OzT7ai5E3CTghiL7NRB7?=
 =?us-ascii?Q?+WjrrCVvacXoZsMXF/hby9v6CJ4rXW2ycXAnsa2E2tBm+1Vg5Gr6FZfGFJN0?=
 =?us-ascii?Q?y+brYyuT5TlAFKpB1J4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ff615e-230b-411c-df4f-08dbb9957584
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 04:52:57.5352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dtx8avV0Lgpm2yyveQ9psxlGO3ME43xNgedluKAA79QG6c6llTsF0aLFcKskeYeOe8lTJO+1bCT/WymtncgGMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9194
Subject: [virtio-comment] RE: [PATCH v18] virtio-net: support device stats



> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Sent: Tuesday, September 19, 2023 11:37 AM

[..]

> +\devicenormative{\subparagraph}{Device Statistics}{Device Types /
> +Network Device / Device Operation / Control Virtqueue / Device
> +Statistics}

[..]

> +The statistics counters wrap around to zero on overflow.
> +

This should be normative line such as

The statistics counter replied by the device MUST wrap around to zero by th=
e device on the overflow.

Some English can be improved probably, but I guess it can be done later.

With above, small change,
Reviewed-by: Parav Pandit <parav@nvidia.com>


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

